Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C3FF9D9
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730465604; cv=none; b=uqvGytQp7U4SJRNmtqepHH6SCoabTe2ZTipM3xFp43l6Od6/Vm7vKF/aVro372MCUMJ4E9nwzASXCKRd0+sGrWc29Fh25av3vdtzf1n9HM9V5sPhaN8JDWu92OCbt5Wh448lKu6tcodm0tz74zRiQgB2h3GpurZJQ7RbPUit9bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730465604; c=relaxed/simple;
	bh=YxqeZ7LX07PGvJAs/E7ZS9RloREB37FNC94Qfz16COA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fyIZHCXyLFc8hHcRQF+8+4S8qI9JsKJxWUT+zHlh9TabpNfc+Qoaa+zYTbg1I/hC0B+6rHfFB0K5IDHO18lJk49sR//NgeGjjBnYnBkbDaT6O/Jcc9tphKa18apNSHssTdRXZbKuHWvtGU43dBoZAryu0bKaHip0L+O4KtfYF8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=ye/LQCm4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="ye/LQCm4"
Received: by smtp.kernel.org (Postfix)
	id 241D5C4CECE; Fri,  1 Nov 2024 12:53:24 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FCFAC4CECD
	for <soc@kernel.org>; Fri,  1 Nov 2024 12:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5FCFAC4CECD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so1581928276.2
        for <soc@kernel.org>; Fri, 01 Nov 2024 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1730465600; x=1731070400; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tQf8a9cyuQhF9yrIlb01NAr4V5CwM2Bx+c7NhZntXuo=;
        b=ye/LQCm4ta5ywq7p4AlfQvk6c3fTe2+ONMkoh7RAAvFfKk9HNBLgBQcHYNIaep1NXS
         Cka0OvyKfJvG9QvZZEt2mqXqsR9Cqnmk1onqiok0GurmMKJmk+/OWAcbclnuRRGHJ6+I
         hCeXwuxUGkorWHl+cjEkfDb8yxgOZagSOzpXiwwJ5iR2budvPpZQv1dM773MGPoGxGtn
         nH1LMC57EtuarMCvLOBAzNnQTCqKfNF5rwRNRTkx6dwNEQmOqakd8HHyzeK8KREqRuZP
         mh0Vbrw45NNNmh6tjwQ/D35iM5teCagjeG/9syaksjer+JYYtbGSye22F6XXExwsejl6
         LbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730465600; x=1731070400;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQf8a9cyuQhF9yrIlb01NAr4V5CwM2Bx+c7NhZntXuo=;
        b=pf55qu54PNb0zZutFs8BOsk6qjL5ABuBmSBbllQJjDrE2j7Aap6F2JIUDcrNOJQjzl
         +Fiznsx8CBlgWaTmMKG3UDdSB6Frp7R2KfJdAF2SpBk75g6VSbwnuw9h4dIUNUN43vE1
         DQ3Ns5MTD+9DDMmDFzZkqky35qKgXTKxoyBdJwRPqwRbz0BrS7LIvd4HNmUPnl7dlH1M
         rFKATKrs6og7in9DVdEN3ZMc06bwEDEUR33ip/Z0sl1Jxd9qLnnjKJUNc9G0K/6d/Mgq
         uy+2RDaxfCIkhuYWK0ZNp1V1iiW1Edgl623J+ftvue1S3eMZKZCu46Oc4hyq95dRmupC
         7wpg==
X-Gm-Message-State: AOJu0Yz7WzdBwoG9ziGRloJ33LorTuVdcKe+AeSzDlefSav0lTE6GxkU
	LHFLSoXvnlO5moLO3JRqO1P06eOnagP04xLe9I8TH2dct+965f2QUcJ/YCKmxixXCfKikUuhE/g
	q/MtF2XFzJMfvvw5HXGD9DoVDS2FnrIZs0d+EH0zWD01+twPRjOce
X-Google-Smtp-Source: AGHT+IG1ahQw3qC+9Y4Iy2xBQRRLYy86ES6yLyrdUIrfkc3nZ5jEjEIXHn7dXrv3mSphF0f70JvgyciAVVSAKFz+H7k=
X-Received: by 2002:a05:6902:b0e:b0:e30:cbde:1252 with SMTP id
 3f1490d57ef6-e330266ec61mr2258969276.36.1730465599885; Fri, 01 Nov 2024
 05:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 1 Nov 2024 13:53:08 +0100
Message-ID: <CAHTX3dKLb4nOVpVvnwyxE6zJZNXpiB4hh=WzpKWwhqP7aLobjw@mail.gmail.com>
Subject: [GIT PULL] ARM: Zynq SoC changes for 6.13
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull this cleanup patch to your tree.

Thanks,
Michal

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-soc-for-6.13

for you to fetch changes up to 4972111505158555b9b256f17b032463381bb38e:

  ARM: zynq: Remove unused zynq_slcr_init() declaration (2024-10-02
09:13:08 +0200)

----------------------------------------------------------------
ARM: Zynq SoC changes for 6.13

- cleanup zynq_slcr_init()

----------------------------------------------------------------
Gaosheng Cui (1):
      ARM: zynq: Remove unused zynq_slcr_init() declaration

 arch/arm/mach-zynq/common.h | 1 -
 1 file changed, 1 deletion(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
