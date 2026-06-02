Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC943EBF0C
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408570; cv=pass; b=FL9cASz4nkJhdeHXNHwNCxsEtOPBONg4fSmwB1GppVfHstlxcDVVjL4FdqpOpz5w4Kq2mupQ12y9sskgdYoCu8F7o1941DuVQEEOCGb0KGLpR186yUs5o8MKdu1HCQe4oqM6gGNPP1Ll2F8/IQKt1hvNgCmTalhjp2j6Dg1TXX8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408570; c=relaxed/simple;
	bh=2XMsycIqZi5cVvZqoNufjj6G9eiRxyRPfMPVVwer/Tw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jWQcsYY9YKymHL2EQ3VenpywNZqqhk7VgOzQTGXvvG56oGdgJZbqbXVYoOl+GsDHa4tCLe0ihnXAGpC1X+jjZTXEeTjMnijLAOI4lFYwN0w6MFi45Z4KsQo//yglku29HW6GIMOqAazMQeuPom5MY8BfgN+ZwDJbVdEmApC/afQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=z24Wo/ZZ; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="z24Wo/ZZ"
Received: by smtp.kernel.org (Postfix)
	id B947B1F00899; Tue,  2 Jun 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780408567;
	b=d29yoQdPwu2PVCoOWLK/vfr0QKQ2gfE3tr3M/XQUcxZcNBGd0/sj32BVtKuky/p9s9WD
	 kn8H3LGl98u9a8LpFy/RDoFw4h5ozBjbQQ7X09GgXZE/N6+ejWS9DhKs55qznmZf0S5gP
	 pp5FXsns72aC7Ms7KKrYren9Kh4MFNnDxYjjORe77Gx9iDvm7es8bt9ubmGtUcl78jJeu
	 PnGRV+Rpkbstva9zUAFVjU2+C2Mhkak/hQrPiWGY0iJp3ZdLxybjZu7gUmkjlbKPO676+
	 kYKUsYyM1pdjrdwMIagczq+HNPZuzXFqLdErqCZr5POrLg7ENHPbnztAqt+x3vwdL/A==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780408567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=t9jtpHRRJE/DKOFfDRogyp/xh/qyYac7Jc/ujWsn6Ik=;
	b=nJqez8UquQ08KZhrszXQ2KQgsDkOr31+M5c1Q09XP+7cllGbBL17uT/26aO3FUsJpoCq
	 SUO6nmRgYmDMdJz4I3tYNIFatXHiTAxQRmE1EW1lXucc5nql3gbWVWD5FgPAkrQz1fYcJ
	 wAtMcOBCTzEzHumvPwEoPjXMz95vBnbLPcAqfVatQY4vavXLnlP+Xa9VOqGPRjgn0ZOXj
	 iDYTKJt2Fffcr5/HitI9enNo9utwDiHrqs4l//F4tjD40C7y0bakj7VPpGwqZ3vOIrrU3
	 34z8O0JrspE5FMs/6JqQNwe43ccqR/q7pMrw9FlJGiDweGTtLfWwWiYX2nQQhkJEYNg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="z24Wo/ZZ";
	dmarc=none header.from=monstr.eu;
	spf=none smtp.mailfrom=monstr.eu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20D831F00893
	for <soc@kernel.org>; Tue,  2 Jun 2026 13:56:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=z24Wo/ZZ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 20D831F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66039d3efcbso5587319d50.2
        for <soc@kernel.org>; Tue, 02 Jun 2026 06:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780408565; cv=none;
        d=google.com; s=arc-20240605;
        b=SthaoumLdOwBcaMZkS8R9l8E6Nc49nRL4ITJpT+AjBpqWiEspDqCC1ndL3ZJDgd/jM
         5zo1j84FDLtduRnv2Qun1MGOSvivyr2hWTtuKd3fM1kT4b9r8NXRkAXYvbOyAgeRjMJ7
         0UmrI3Y1RNEQsp3nIMbTy+xfpW14v+7ko2C0IbN4V8029fX12GCsTmoNehWTyXAptXj0
         fiCLutv73C0IVUA1z0lVNpeQvbgyk7dLJQOiuzJKaeYkFD2c4nmZX8o59vL6LylcBEkZ
         rMfyoh/zX3omwvxBz7MFGPLC95y2rquijkshOT0b3hFd+92BOKi2UFhPGHRvuPizzum+
         g6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=t9jtpHRRJE/DKOFfDRogyp/xh/qyYac7Jc/ujWsn6Ik=;
        fh=ngnzniW9/251Blo+3H7OvJM/allDljIxuXeYmmxYfks=;
        b=DpuWrMXZQAcoJTuCZMAheFNgLDqxivCi2YNbJTc4TvhePYIk+6T1PnD08KtBq9Md23
         5SVL63txQiz5gEXYlxGIULbeJISsAK6eLKT8vXWbu1FV8DMz1vafot/lVCgXg0KsHbI7
         Ohk2TvvPOGEWYp9cL6++LY9OYnma4/sE0QNPMbyXWZgVtAXXGI2eCSnU/sN4SJKeQFUi
         DZnFN/v+cIdZCSFkKAX5zWQgXDo+ITatIwIK+VSf9sNRzRNaOJFJJx2fDxcy+KW8w+yB
         qKpOEi8iO9oLjq5IvAMe6Ku/IKmnisPUMqBKsz7JUDv0N9BHJ38Q6Xs784KYCCtIfn/4
         RTcg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1780408565; x=1781013365; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t9jtpHRRJE/DKOFfDRogyp/xh/qyYac7Jc/ujWsn6Ik=;
        b=z24Wo/ZZy3RzcFwU0hjbkODuOVEBkQpYTfeGLQE3NHaGEOwpRJ01eyH3EmE+C31kEV
         F7PAyLk2psTgks4UaJQK40NvVbXSjTbaj1Qo4f6u0ry4cTqb/jQrmu6y0ASMckpBz1uP
         9SHgIlzvObGk2tsSYNitENYLksh0NcYT3uQsLUTcM85i6rl72NspUXA4D7h0WmJAoqrk
         igG6xxoEJa2ZMeptFEv/otu4c3UICOelTMwk2w5eZMxYnBntBwNrOuPF/aDh35kiOfBr
         VEoKuhBoJ40r2YfDkAgwGhkyme/cbOYLSkh3HZS4u7I4NZ5Jl/YsF8/5+dYbsOw1E/Ki
         82Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780408565; x=1781013365;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9jtpHRRJE/DKOFfDRogyp/xh/qyYac7Jc/ujWsn6Ik=;
        b=dOonazgG43RoHl4Q4LYU2cVkLzysxVVKBF7U+gvt1ly4E5MwQVHCNitH9E3oqACscV
         ZlHOxhYDOV36x5Hawu70p1Wzmdgu58DfbaSym1d+ii2eXsYIPnUaDXAwuiI00Zr0jw5p
         am1Ymf8V97OIpmvecJ9heiLLEDU8dT+ZbTlRhAyRJ2rwv8DeT5zJElsecoON4iEx3F0d
         18yYQa/RI9scKJM4xSSFjmDRiQg5K+QZOw+aiaLV9o/A7MEZj81q0Z6DNYAvrgxhUvB2
         DaBVah8nZe8vQ7LBjrtCrpEz1aCjvcFTeb9AfQiElBFqKjUUOphBWxWZz/2xizyXhDKb
         01eA==
X-Gm-Message-State: AOJu0YzEsypGLaMEMHY/DHumiRlFl3BgcN+3dNYA4lAYxoln+VmpY/2g
	ionpUZ2OYv0UsYXkZBYZhC4WaXf7DtYw45thcF5RlZjxTPxpOCGesPgSZuBsrjumftWBCQpkBpy
	wwKSCQP9aKm10xw8wqecGxJqmolUyjRcmnpjt3Q70o0vvmCvYoKu9GKt2
X-Gm-Gg: Acq92OFCrR8QGw1RAaaRtA5CZCdw/l3H4zN7JqcetnVFQ7kbCQqrbEA92QDKZRqunsX
	vE1TWsJZNwLHZRzPWDz95zqSpbuwXae6ZI+6SMmGq1bADTNpZSh3O/l1aubhRbS8PWXHhA7DjF1
	TDVK3KTM5Wg6XRYI+ofwe8ptWb21bip/7LweErXsHPTBpRSwk+eFy1YpESZqgax8fGn193BBEEw
	RCUqRN9WyeyIMcbo8tgM2f33YNRTjcT4onmOFebRaZuVVrGksyaqGZMrpH+f1fculomZJfR6SVZ
	g0rPHItd8ydYd+s29bpQ/bJ6ehJzobP+GyZZcPNMA+HlWGjO9LM=
X-Received: by 2002:a53:ac81:0:b0:660:55e1:5bb0 with SMTP id
 956f58d0204a3-6605edd30e6mr13392101d50.22.1780408564617; Tue, 02 Jun 2026
 06:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Tue, 2 Jun 2026 15:55:57 +0200
X-Gm-Features: AVHnY4L18eyVlhjycUY5iNpuboxB-7Rv0SWEmLrcTIjnB41jeLOIdSTZeBHV958
Message-ID: <CAHTX3dKJBTQ9TF2TeTTjsWBo9bkV=39b5YjTG7j+tqct0Q-E5w@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2 v2
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these 2 patches to your tree. I have removed that 2
problematic patches from my queue.

Thanks,
Michal

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-7.2-v2

for you to fetch changes up to fdee7c66c0d7b6869c36b9f9a915abf29ab5b550:

  soc: xilinx: Shutdown and free rx mailbox channel (2026-04-30 12:50:05 +0200)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 7.2 v2

zynqmp_power:
- Fix race condition in event registration
- Fix shutdown and free rx mailbox channel

----------------------------------------------------------------
Prasanna Kumar T S M (2):
      soc: xilinx: Fix race condition in event registration
      soc: xilinx: Shutdown and free rx mailbox channel

 drivers/soc/xilinx/zynqmp_power.c | 47 +++++++++-----------
 1 file changed, 20 insertions(+), 27 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
