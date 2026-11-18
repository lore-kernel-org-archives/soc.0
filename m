Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013214;
	b=zmthvsDflk+91CW1LXbvG4/z3+kJ/RBTYGfF5b4i39c5lWBcEjT8zu8Q2o94qm/FwpvO
	 5Jp7bxeLUOsvQORqcr6TsS9lyjxAZ9HWyvs/AKsM6ILg/HUAIt8rV7TUBrUQq1tOQ8kic
	 Rpp5KDiGUDgdqIYX0NZ33txp6ajdT0lMWZLV932ZsbiHca6VyKKFdM36RfQncZCU0QOjE
	 EzItFMRIx8LZ/1zhJ2owPJJkgqO5f88hPBUSjUukwTJjJ9/sHHt60us7qc2w9YK289KiE
	 4m/QTK89G0gOG5lRgEV9wZ+lkd799UcNQ416fkOlCFTWhh9yLeAIl3dP8hZK2qJGP0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013214;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+Oey0KacNEWi6Nkk0b8stUVZLSrILgzihXsUP+2Ioq0=;
	b=DhkAbrLQxEVDCGc/LUD38aYtMtgh5Wpq5wEbo/NM6VjkohH4bQmebZ2SpMj5z63IPfZj
	 Q0fAGJCLbBhclBWMyWZZe0t39znTYQldjTX4Brk4G9BlW0D1UrraumZJC/UBj4J4Y5pjW
	 04wkZ6MkJv0KKWO0t/S3x8eRIsb1WR4Y3BUOpU22Q6aVhI+vrBjJEcMMX237lwPH0bxWf
	 O6OBGr2Ax7QRpmPqKGX4eydJ8YPqszr9O7pZHY2XqWWcDE+W+xMJ/lNZMshYonj1EXqDQ
	 jxASBqxwy/nwOMsQHPNj5kHtzoLRlbr0Nr/fzj8i3qvFun8HD1TgD8cY8zQTexqC7BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UKhPUCc1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE29606A31C;
	Wed, 18 Nov 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UKhPUCc1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3AA1F000C4;
	Wed, 18 Nov 2026 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013213;
	bh=+Oey0KacNEWi6Nkk0b8stUVZLSrILgzihXsUP+2Ioq0=;
	h=From:To:Cc:Subject:Date;
	b=UKhPUCc1+2UtkrWQTn//V7TLI3NYkTmn6pgy4Vr2qQBMS67EsIFFl5zA5Lga4aTTQ
	 Y2jJqc/KUcADzuMd7P1TarmZrotnN/nMBZjLxi+eAuI8XZBNEy/xsDCK1r+nG0kbl4
	 aV5Cjy6H0cIhz9uY4Z6VHOFSbBqho1H5wBZs10txWSDX2VemXZmcSCMM0WVcj/6d4H
	 ZlqsW4uz5jOugIdfkphjvsbDG8gPS8CEiIY1SiEi6do07HyPf37DLvsf3Zb4t7X2hx
	 FT7wTZcCCGui1YvPtA4ZhwuCCxuCh3Kh0wU4fzAbz6bQOuMbximUJhZAAWArMALd+N
	 P7QOhF2fgk/3Q==
From: Dinh Nguyen <dinguyen@kernel.org>
To: soc@lists.linux.dev
Cc: dinguyen@kernel.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] nios2: updates for v7.5
Date: Wed, 18 Nov 2026 08:46:52 -0600
Message-ID: <20261118144652.3124085-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/nios2_updates_for_v7.5

for you to fetch changes up to a5a3d39f231793f7b15d44a672011906e55039bc:

  nios2: Drop usage of libgcc in favour of GENERIC_LIB_* (2026-11-18 08:20:07 -0600)

----------------------------------------------------------------
NIOS2: updates for v7.5
- Add software emulation of div/mul/mod for 32-bit platforms
- Add a divsi3_table references for libgcc-less build
- Drop libgcc dependencies for Nios2

----------------------------------------------------------------
Dinh Nguyen (2):
      lib: extract 32bit mul/div helpers from nios2 into GENERIC_LIB
      nios2: Drop usage of libgcc in favour of GENERIC_LIB_*

Simon Schuster (1):
      nios2: export __divsi3_table

 arch/nios2/Kconfig              | 10 +++++
 arch/nios2/Makefile             |  4 +-
 arch/nios2/kernel/nios2_ksyms.c | 22 ----------
 arch/nios2/lib/Makefile         |  1 +
 arch/nios2/lib/math.c           | 24 +++++++++++
 include/linux/libgcc.h          | 10 +++++
 lib/Kconfig                     | 15 +++++++
 lib/Makefile                    | 10 +++++
 lib/divmod.c                    | 94 +++++++++++++++++++++++++++++++++++++++++
 lib/mulsi3.c                    | 24 +++++++++++
 10 files changed, 189 insertions(+), 25 deletions(-)
 create mode 100644 arch/nios2/lib/math.c
 create mode 100644 lib/divmod.c
 create mode 100644 lib/mulsi3.c
