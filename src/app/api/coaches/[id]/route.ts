import { NextRequest, NextResponse } from 'next/server';
import prisma from '@/lib/prisma';

export async function GET(req: NextRequest) {
  const { searchParams } = new URL(req.url);
  const id = searchParams.get('id');

  try {
    const coach = await prisma.coach.findUnique({
      where: { coachId: Number(id) },
    });
    if (coach) {
      return NextResponse.json(coach, { status: 200 });
    } else {
      return NextResponse.json({ error: 'Coach not found' }, { status: 404 });
    }
  } catch (e) {
    return NextResponse.json({ error: 'An error occurred while fetching coach' }, { status: 500 });
  }
}

export async function PUT(req: NextRequest) {
  const { searchParams } = new URL(req.url);
  const id = searchParams.get('id');
  const { coachName, email, phoneNumber } = await req.json();

  try {
    const updatedCoach = await prisma.coach.update({
      where: { coachId: Number(id) },
      data: { coachName, email, phoneNumber },
    });
    return NextResponse.json(updatedCoach, { status: 200 });
  } catch (e) {
    return NextResponse.json({ error: 'An error occurred while updating coach' }, { status: 500 });
  }
}

export async function DELETE(req: NextRequest) {
  const { searchParams } = new URL(req.url);
  const id = searchParams.get('id');

  try {
    await prisma.coach.delete({
      where: { coachId: Number(id) },
    });
    return NextResponse.json(null, { status: 204 });
  } catch (e) {
    return NextResponse.json({ error: 'An error occurred while deleting coach' }, { status: 500 });
  }
}
