Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941527;
	b=DUi70/oCbjoZTu2tGjZmAfBzkrRawrYfOjLtsXon/uJGhbOCu4EdYaj8mAF/p2cS64gp
	 MwyNcidxTKQ0SisD3nvw8KawzvX9cBErQM+8QEkdDTNtPq8AwQcdGIhZ4Lb3pV05tqU6r
	 Q9FG1X+Ro9f1y6N0Rwpl+HSJY3QuPwfK0fgMjktFNIMz7EGlaf/1mvL3nL33CGwfIuEyD
	 Vo9B1q6yYmSBPs5NJf2ij1qcTmYhuCevQxnmKf5M3+85CS3Vz4qndMRdc3iWPSXXpKDtm
	 WgvljRzbzfrmMnmCEEQ4ZI8tuFOk99CZ/YNeHLtHAX/sMn2NP13rvHg6b3oY8oexB+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941527;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gqR+F7gVJ9rNyT0hWAQ5lLNLohFVCHLjOQf24JgO0GY=;
	b=1RnZH11Wt6vMOf0abPznJZop2O9Al9fFZVFBFmAT4l4RMeOw8WmS0Z8bpV+FFhv1H7GS
	 FxFYbDfMmaZH+T4hzudgxj7OGLCIFrtdZJkmo9XYk6bOwiv6qFGNZTomCuX0ShsPvipq+
	 DT3xmf1LRoqWgCim49xrWxVfpqq4KRGB0Sm5BkYF/OXiigyYhYj2FMF9SbKHXFvKsOuDW
	 kjBan0ka9W8U3xMc8zP0S1B70OLKn5XjDk95AD0oF6q2mgo6Ai9Th6UgdkP2yXFnTaq7L
	 w2YhMj0cANPuUMDW+wF0uzwI3KlndvBfrjX+JhkRSeArZh4/+xyZecD0W4ZypSVBxsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mK3LAYqM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0FC606A31C
	for <soc@lists.linux.dev>; Tue, 17 Nov 2026 18:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mK3LAYqM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095481F000C5
	for <soc@lists.linux.dev>; Tue, 17 Nov 2026 18:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794941527;
	bh=gqR+F7gVJ9rNyT0hWAQ5lLNLohFVCHLjOQf24JgO0GY=;
	h=From:Date:Subject:To:Cc;
	b=mK3LAYqMJ1GTYZnLqpHNjXKk59alE08ZFNTX4JNhVRjZNRL5hiQbNuXZStm30wura
	 lGCwcLW/u4x2NlEBTWa+w7I7czAEv87ux0z3R3is+oOQUFneeFaSO5lwgX0xcYVQC3
	 7OJOcw9jjwrbsiGvIX1EHhQ5AsJLbZwyo4uxeIOLS01DlFAdP2xyQS/5TKFrKbPQtX
	 hZK9HZ2J223o0MnRN2wIEsuCUupEPfmktK/ZgzcCTF9/5YfkMI8DQyd3D3c1s70hap
	 yXoqNntcV6XfrwxarOYlSjiJwKfDVwl1wePqK+beGmG92iSfwYrEl5A6H3o3ySzF1a
	 C4UBbGtEuJN1Q==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c151178f0cso99674e87.0
        for <soc@lists.linux.dev>; Tue, 17 Nov 2026 10:52:06 -0800 (PST)
X-Gm-Message-State: APuU4Z8ABMr3PiiUYHjMBOMv/tmTaJ7mrTfRsdkUDjTrms1UnrJwE2N+
	y5wsM+UDYuaLTI1OyNTFXloBgS+I9As6r7sUWUs28YfbTMCVp/xcq6L9L62C1cKsPCwdcu18MWI
	YCJO7mrBb/mTTXVqKuLtoU1Zf8Z9nrko=
X-Received: by 2002:a05:6512:2381:b0:5c1:57ba:f848 with SMTP id
 2adb3069b0e04-5c1a98d45f4mr61721e87.0.1794941525716; Tue, 17 Nov 2026
 10:52:05 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 19:51:53 +0100
X-Gmail-Original-Message-ID: <CAD++jL=1xfmNQf-=ejeDy6iL5BL_yiEFnFtPsakufN4QkipS3g@mail.gmail.com>
X-Gm-Features: Aa3M54oOP4o0Yt1r8edslc8_KYEjmGYNVrS4UJmWgAw6m2tO5wJNxwFv7iCxXfc
Message-ID: <CAD++jL=1xfmNQf-=ejeDy6iL5BL_yiEFnFtPsakufN4QkipS3g@mail.gmail.com>
Subject: [GIT PULL] sram runtime PM
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

the following is a single patch to the SRAM driver that was ACKed by misc
maintainer Arnd Bergman and needs to go into the SoC tree as a drivers
patch.

Details in the signed tag, please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/sram-soc-v7.5

for you to fetch changes up to 2e2ce48be3da719d1814154e385548d31c59b579:

  misc: sram: Enable runtime PM (2026-11-17 19:46:26 +0100)

----------------------------------------------------------------
This add runtime power management to the sram driver,
so drivers using SRAM can increase/decrease references to
SRAM memory and thus eventually power up/down their associated
SRAM memory.

----------------------------------------------------------------
Linus Walleij (1):
      misc: sram: Enable runtime PM

 drivers/misc/sram.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
