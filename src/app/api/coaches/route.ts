import { NextRequest, NextResponse } from 'next/server';
import prisma from '@/lib/prisma';

export async function GET(req: NextRequest) {
  try {
    const coaches = await prisma.coach.findMany();
    return NextResponse.json(coaches, { status: 200 });
  } catch (e) {
    return NextResponse.json({ error: 'An error occurred while fetching coaches' }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  try {
    const { coachName, email, phoneNumber } = await req.json();
    const newCoach = await prisma.coach.create({
      data: { coachName, email, phoneNumber },
    });
    return NextResponse.json(newCoach, { status: 201 });
  } catch (e) {
    return NextResponse.json({ error: 'An error occurred while creating the coach' }, { status: 500 });
  }
}
