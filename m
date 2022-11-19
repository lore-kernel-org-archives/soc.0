Return-Path: <SRS0=fmoZ=3T=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519E4C43217
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 01:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3902EC433C1; Sat, 19 Nov 2022 01:20:34 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55E09C433D7;
	Sat, 19 Nov 2022 01:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55E09C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id h23so1501599edj.1;
        Fri, 18 Nov 2022 17:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NefUSVzURATnbl/MU1ae3//R/0lpATSVBKvZxN+jiNc=;
        b=NS1DMYNYU1mhU7HIXYnO4KkhIHMNY4vvuAdqH9uKOpl89VMr2bbDbQn+Y/VktjsdVJ
         9wPVIDJHvZpi5IsYO/o+7HecLgbtCFPcIWnYd4rg7i/ISAkE3ie+kcvrZ1fbsUOf4cuc
         yqAQTqmabjggbE3OShfr8snbsP58KHQdSWtp9BLeyN782egKRkTu3iC3FHywsbmd9wr8
         TseCO/1b6wlg+vxjEYkMspXys/2g2ra7eKgWCwftzK4Og++NCev0Yk5ikfBvOa2rhx7G
         2I6Tj4RLumsSRf1mcqUNjjQExc6AcvaNlIc2u9X0ir3X4VuG92m4O4S5tkOOBvUgXSBT
         KGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NefUSVzURATnbl/MU1ae3//R/0lpATSVBKvZxN+jiNc=;
        b=Wvha31FdXd9Y11gnV3FplC/VdnKjM16oIiQllksei6Axl1ILzKQuH08yeOYV642tqc
         63RSAaRhQ73LG5HcnAqObFdWMBNdy10BmEVxazXk4OPsf8uJb9dzw/4PMLP0TDrro7AU
         85YSVdvXV5O/jUTrbfxUqOVJk63cf0gLL7rzyWfqoyZ2EXlVdCNMirCrG13ioMgDWIIB
         aEuaseT+FgedNwMfS+d/8aXe7AuueWBwH8uH+vK5U4Vd7mBAcuanj1KykChGWGCvUE/b
         mE341UnJ+wRofhjVbV8kbnW+Ydc/axLeMp6bAfmUlKBsYCANidxYSs77A/zR04OESH8Y
         zA7w==
X-Gm-Message-State: ANoB5pnTyYAQHrCk+L28m3F4elDD5sO3hoARD82uKEzIV5UxCFHAny8p
	AGhy75hboqpM+MtIjS4DSZ+W8nzJCP0=
X-Google-Smtp-Source: AA0mqf6zyqlJjSA2s/fiAhGqpUOr2hhLpRwrkN3yauTqSInERE8rV4hu7+PrymVD4lDc9vAm7nE7ug==
X-Received: by 2002:aa7:c9cd:0:b0:461:891a:8162 with SMTP id i13-20020aa7c9cd000000b00461891a8162mr8092370edt.398.1668820831342;
        Fri, 18 Nov 2022 17:20:31 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ek19-20020a056402371300b00458824aee80sm2408019edb.38.2022.11.18.17.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:31 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/8] ARM: tegra: Device tree changes for v6.2-rc1
Date: Sat, 19 Nov 2022 02:20:23 +0100
Message-Id: <20221119012025.3968358-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-arm-dt

for you to fetch changes up to e4185804e191bdaeb10ebe00b1b4aa9e2f147a56:

  ARM: tegra: Remove duplicate pin entry in pinmux (2022-11-18 00:22:02 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.2-rc1

This fixes various minor issues in device trees that are flagged by the
DT validation tools.

----------------------------------------------------------------
Thierry Reding (6):
      ARM: tegra: Use correct compatible string for ASUS TF101 panel
      ARM: tegra: Fixup pinmux node names
      ARM: tegra: Add missing power-supply for panels
      ARM: tegra: Fix nvidia,io-reset properties
      ARM: tegra: Remove unused interrupt-parent properties
      ARM: tegra: Remove duplicate pin entry in pinmux

 arch/arm/boot/dts/tegra114-asus-tf701t.dts         | 24 +++++++++++-----------
 arch/arm/boot/dts/tegra124-nyan-big.dts            |  3 ++-
 arch/arm/boot/dts/tegra124-nyan-blaze.dts          |  3 ++-
 arch/arm/boot/dts/tegra124-venice2.dts             |  3 ++-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |  6 +++---
 arch/arm/boot/dts/tegra20-asus-tf101.dts           |  8 ++++----
 arch/arm/boot/dts/tegra20-seaboard.dts             |  6 +++---
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |  6 +++---
 arch/arm/boot/dts/tegra20-ventana.dts              |  6 +++---
 .../boot/dts/tegra30-asus-transformer-common.dtsi  | 10 ++++-----
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts     | 11 ++++------
 11 files changed, 42 insertions(+), 44 deletions(-)
