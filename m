Return-Path: <SRS0=gyVr=75=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864E3C76196
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 12:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64F2FC433EF; Thu,  6 Apr 2023 12:48:11 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DD8EC433D2;
	Thu,  6 Apr 2023 12:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DD8EC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-4fa81d4f49cso1097861a12.1;
        Thu, 06 Apr 2023 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680785288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQvlqYvR6sS4CieACuBktQlataafYZBOFQDgRDpamf4=;
        b=nYzZtuGz8DqNxFUW0IYdhYo7feyWGR4M2rJ6XPzQCM4dLeM/jsZlTmCR85fPdoEEu5
         Vw2uL4+xIHmqhFy3SyVa/1oIjOyEyiWw1j6qEgn4tYwG22IVjBjrSTBrBGZkeUd/jEBC
         RzmX3jRR4lxmAXVIkTgXrXtnfOER+aa8Sp+1j6hUxqeEC++ADb9K5frVbUIiOjrUJuz6
         SiHZsc0pvojeKFrcmeTs7OfbjTtM/lW9uTucT68eUcfw00Qb0pFQA/mqY6E0hRzRp4QT
         BpNbDdiIoP0R0QueDdv7SoWWrH6VjHSNs6rM27QILx29yvTeFRo5fNaiufbSntOnQ76D
         M24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQvlqYvR6sS4CieACuBktQlataafYZBOFQDgRDpamf4=;
        b=OYEujRXP5VWg3HFj5OqXrWU47zn3WldmrtKrIDKf/0iw38MvCSGgxynBbBhty7+GGu
         WhtNBVmnITJGR+pYd5VPic2rqzU8z0Gxwtazm4yFpIBe2hrXvsK+B9l9kIgyOOckac3a
         P24RkYzuymeL+wC6r4nMZpoMoIR8vLTMcY6ZMfED3exVshSxqAgkGF8h5fpGcr+f4VKF
         zyWusnAo5pDlGvJ1H02Ad8Ms3EHKuBS95+vb0UMVR0T5obpKAWGE85/1ETaeDJh3dxoJ
         coduy0x7MIORnJahMUkvV2s5vpHyrs+ArIjsHO3SL9+6BUFoleY2DMdMsWqASNLrp4pt
         Wvkg==
X-Gm-Message-State: AAQBX9da+nVMmbhwb7W88ZQihfh53LZ5tHN1Ms5Mdtmvrsqo2Ilyt5fn
	sSnbNMMfwXrbaEuHEZ3G1IaX3XYCieg=
X-Google-Smtp-Source: AKy350aWkcBXkzrpWCX40rmz30/AootPUiYaoMzsqADg8Ojct/ULFn9izlFcnra34nYMnGwOdFe0JA==
X-Received: by 2002:a05:6402:b06:b0:4fb:78a0:eabf with SMTP id bm6-20020a0564020b0600b004fb78a0eabfmr5532994edb.29.1680785288552;
        Thu, 06 Apr 2023 05:48:08 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h2-20020a50c382000000b004ad601533a3sm720541edf.55.2023.04.06.05.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:48:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/7] ARM: tegra: Device tree changes for v6.4-rc1
Date: Thu,  6 Apr 2023 14:48:02 +0200
Message-Id: <20230406124804.970394-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406124804.970394-1-thierry.reding@gmail.com>
References: <20230406124804.970394-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.4-arm-dt

for you to fetch changes up to 13a53ebc229996f424bbf7db466f1ff96f73e8a5:

  ARM: tegra30: Use cpu* labels (2023-04-04 14:32:48 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.4-rc1

There are several fixes and cleanups here for some of the older Tegra
consumer devices.

----------------------------------------------------------------
Maxim Schwalm (1):
      ARM: tegra30: Use cpu* labels

Svyatoslav Ryhel (4):
      ARM: tegra: transformers: Update WM8903 sound nodes
      ARM: tegra: transformers: Bind RT5631 sound nodes
      ARM: tegra: asus-tf101: Fix accelerometer mount matrix
      ARM: tegra30: peripherals: Add 266.5MHz nodes

 arch/arm/boot/dts/tegra20-asus-tf101.dts             | 19 ++++++++++---------
 arch/arm/boot/dts/tegra30-asus-tf201.dts             | 17 +++++++++++++++++
 arch/arm/boot/dts/tegra30-asus-tf300t.dts            |  6 ++----
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts           | 17 +++++++++++++++++
 arch/arm/boot/dts/tegra30-asus-tf700t.dts            | 17 +++++++++++++++++
 .../boot/dts/tegra30-asus-transformer-common.dtsi    |  9 +++++----
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi       | 20 ++++++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                       |  5 +----
 8 files changed, 89 insertions(+), 21 deletions(-)
