Return-Path: <SRS0=cZg1=WP=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E6AC433EF
	for <soc@archiver.kernel.org>; Wed,  8 Jun 2022 09:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92BA0C341C0; Wed,  8 Jun 2022 09:31:41 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB12EC3411C;
	Wed,  8 Jun 2022 09:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB12EC3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso15670343pjb.0;
        Wed, 08 Jun 2022 02:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A3KmHeI3hAOe7CEnloup1rq0n3cdEzAyF4Hv/d+SyAQ=;
        b=Pdc1z73rrVPMgCzZpzSZIbe4W/2DHj0rZKHe4JLVX7JxybB3UVqGXQffB5mAnCRliN
         OnuLdlsVth6RMS+9sICN16dJn5OlQ33wgOMAFjAUVs82hhvv1wu0+mt72gjgZ/pXrTF+
         M5Iqh/uQ89d2TLufF/JzCXeME5bLR4gV9N0r0NHzT+37FlOpfT0HdiCGSwDPPXrH3bM2
         ElP47e7rmFth/dpz3wrs9B9CBRq2uUZVeN2NOViOV6gLBN5IjPNUiOHA+GN3DGt78YrE
         ZBCg2RkpeY9SObX4v+TrLzU8U2ZhlvcE0l/Wq15m6LEJusviOMi1kT1vkq8T4RvXj9HV
         YQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A3KmHeI3hAOe7CEnloup1rq0n3cdEzAyF4Hv/d+SyAQ=;
        b=RloEFnNiOd4kVTZzxB9VHODGFVLc2jtVUzrm7/PwWtvZGXZVeP/h2XF49aaGo96nrT
         C0eNtFandXuJS+63BAN1Z+XeM38GplbEonl1IhHVD2B9jtYefyrXGGbp5jkL/5NPsLjE
         nYjyUNuXQxO6NRlAc53/jVsYTAxZvFGW5hSPOy+8el3Y944cOZ5bhp8xlNffXTS5TQYx
         A4OmiWFeY6UkXtU6lskOgfWxA5VJvZWK9yK8fKZujy8hmi4dHEUgEAdZrPnmJFeByqAG
         NrlQYEiBWj5QBLJIB9i/pf4+aug0dIOjV0F/08DmW+JBIgoOcgpTN20yoRShGIp4Glu2
         XgNA==
X-Gm-Message-State: AOAM531TRWEm58thsdWGISEh8WGDz8cf/8yJy+C2CZUoV+H13AVAFXKI
	mKei3g8Ut0XV1PQsp9z/yP4BvMXz5bxX/w==
X-Google-Smtp-Source: ABdhPJyPkkOD80nrbzm2/THplU5kxk3GAG58dBprDu419Gw4rQHVrevusqx1KnJD1td5DPf8jM6phw==
X-Received: by 2002:a17:902:d904:b0:163:dd91:87 with SMTP id c4-20020a170902d90400b00163dd910087mr32949156plz.34.1654680699865;
        Wed, 08 Jun 2022 02:31:39 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b0015ee985999dsm14320084plx.97.2022.06.08.02.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 02:31:39 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Miaoqian Lin <linmq006@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom drivers fixes for 5.19
Date: Wed,  8 Jun 2022 02:31:31 -0700
Message-Id: <20220608093132.1465703-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/drivers-fixes

for you to fetch changes up to 37d838de369b07b596c19ff3662bf0293fdb09ee:

  soc: bcm: brcmstb: pm: pm-arm: Fix refcount leak in brcmstb_pm_probe (2022-06-08 02:21:17 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs driver fixes for
5.19, please pull the following:

- Miaoqian fixes a device tree node reference count in the system sleep
  code for Broadcom STB chips

----------------------------------------------------------------
Miaoqian Lin (1):
      soc: bcm: brcmstb: pm: pm-arm: Fix refcount leak in brcmstb_pm_probe

 drivers/soc/bcm/brcmstb/pm/pm-arm.c | 1 +
 1 file changed, 1 insertion(+)
