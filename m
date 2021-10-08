Return-Path: <SRS0=/M0+=O4=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CD5C433FE
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 465CC60F93; Fri,  8 Oct 2021 20:11:49 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22046610E7;
	Fri,  8 Oct 2021 20:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22046610E7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id t8so33251748wri.1;
        Fri, 08 Oct 2021 13:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xphg3l2/2x/WeN6+HltLN1eWB+puBlk2ozbyExKcZFM=;
        b=GvEPVBLaebZAGU6y6wfl27wjhrQY674H03hcqjRc88nqrhF5ta/gF/slf+8Ggsi6Of
         p7W78gAE9BeKazhWrzH9fmtws5/okOIXOhYq27y+bbOeOd1KQ9VcrY6OnC2gAiLlzW+n
         VPADnC8ogRuR1wRiIifrQmyMJNr/fJKzsjf22p9eU9+oI/zrPQn+s/36AUlCW6obsuy9
         6QM4ruRGkSxyzNVDnkVkKlYfTjWUHSEVrvHme07h9uIP2iQ25s4yGI9z/O8C4HsvygzC
         YbCsqgS7m1NZ/LAzCAsPruBAZtDxf9ws3NpU1cJciA0UDViO/Awlox9tx7aNyQmQSM9l
         dRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xphg3l2/2x/WeN6+HltLN1eWB+puBlk2ozbyExKcZFM=;
        b=stMwa/y++ue/5aTqI2hAT92D08SvXMx1sYj5npefBbrV403szFx7v7lKdZK9RbN89U
         Hm8TwLjL6Oz9PIWv1bzqvbUjSLg7o4lHeEj3L5OPMxBUeZii0ffFeZZDeO/0VKEKspN6
         UMFC9/gCv8SNsM58tgPzgRVsVDPnU4TWp5kagvOJepkaGM6IucunGKYvr0ZAMpUppNmL
         ISQg3TFnDs6rSBYlnq9ZNG8CmyloTEhZMC+uuS2G6KG751bnSxJk4kNQ0FiX9Bso7Nug
         ZQ6ypwSREXTnV0cT/zeInTHx1yRgIEbiewurVEqZvC4yStEoj4DeevrKw+89kT3RysxC
         xt9A==
X-Gm-Message-State: AOAM531+jWUQIBTFPlPgHABAMo+UevU0NLb/+IkKNRlqimUMhFXMm7xV
	imgoG4JVSgomre0tYNxNa5lEtJJxm1s=
X-Google-Smtp-Source: ABdhPJxxV0u2rfbBJgUD5YOEA79AfteLO1sL511IgyUcJ6P9M2z7Kk/6rwy8SstNn8rY7oCh8uLeYg==
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr5911176wmd.20.1633723907149;
        Fri, 08 Oct 2021 13:11:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n66sm159972wmn.2.2021.10.08.13.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:32 +0200
Message-Id: <20211008201132.1678814-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm64-defconfig

for you to fetch changes up to 1e9b81616627643eb1a78c8fe98fc95eae74024d:

  arm64: defconfig: Enable few Tegra210 based AHUB drivers (2021-10-07 20:37:23 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v5.16-rc1

This enables drivers for the various audio processors found on Tegra210
and later.

----------------------------------------------------------------
Sameer Pujar (1):
      arm64: defconfig: Enable few Tegra210 based AHUB drivers

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)
