Return-Path: <SRS0=mL40=RC=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB53C433F5
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57665C36AEA; Fri, 17 Dec 2021 16:23:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D069DC36AE1;
	Fri, 17 Dec 2021 16:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D069DC36AE1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id e5so5075064wrc.5;
        Fri, 17 Dec 2021 08:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WGEgqKeQ8cbqSnn0DjBjL7FshAIe0mQv76dnJcpHdI4=;
        b=OyYiXOO2s3kCAP0LhoeRLbGSY3/mzV7j0I+UdQ2Z7AuheHgdet7Z+q7N+ufg05hU11
         VN5/deDybqRc4z0qmatMJbZDAKB4CDckmXAFjgAfr+KMlTMoBzxr/m67qamqlF/5l6oc
         LGsc14oJGSZv1IWMl8n8sWtU5npFS7W91PXZhnByx2sgC9aVN1gfVMu40GqICA76k52W
         wcd0izPOlj3njW/mzjQRS/A7r1xpTJw6VqjqnPVNhpKZsBsgJ8/8plpitDJtHPfD//Ba
         G2GZ1VELqLHo2pKK88k/WUHxnOSKZqgazd043wzgGvE0XedkIWlOSdpxaowroiYihrSI
         QLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WGEgqKeQ8cbqSnn0DjBjL7FshAIe0mQv76dnJcpHdI4=;
        b=HOZfqpWIMQSQopfHF5hZSSGNp4i9t5qMk4RGC+q1IaZpt7T4n2QN1o/6hnnNPqcuu+
         EOQgYOzkZSnDevDgxIQEdfz0fu9UQPpXdEjeQJsirYWdSsPgbrANsADHOq5W8Jek2VQo
         WLolJXfJGIfz/2tAKNX1O9SfkpdjBCB1xFYw6K/xVJtlEJkhmLtlBhVeV35jLKSHATqn
         Tam/oUaU59+UOADvckmaVw8XLAJ7MBbY/bfnFc1f/upJ1jnBJeN0saO7/RSv+GfyjaU6
         QnvabqnJy0ZV1U1o/b/xHf+3tdoDhT/AuWK/4xGHWJ6I+uWQ2889C4owmD99bGZDSrd9
         iRQw==
X-Gm-Message-State: AOAM5338BWmpgTqsIu84PSC/b96XxvFa/m0E4jfy9rihxpqKJqeLL2al
	0W+Rbj5MYw5TO59WEh6JYMLaDfBm3X3gig==
X-Google-Smtp-Source: ABdhPJzUKFqMKerARbdeozSVPlNcrSwBYqllzI6iiAxtsYmgl6N92DBgcw9iyU0dghLUf1JzNZZOTA==
X-Received: by 2002:adf:d0c7:: with SMTP id z7mr3158709wrh.236.1639758187785;
        Fri, 17 Dec 2021 08:23:07 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id j2sm2016322wms.3.2021.12.17.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:23:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] ARM: tegra: Default configuration changes for v5.17-rc1
Date: Fri, 17 Dec 2021 17:22:53 +0100
Message-Id: <20211217162253.1801077-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217162253.1801077-1-thierry.reding@gmail.com>
References: <20211217162253.1801077-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm-defconfig

for you to fetch changes up to 8ed567fbea94ad05298d060974d5fa59946cf689:

  ARM: config: multi v7: Enable NVIDIA Tegra20 APB DMA driver (2021-12-16 15:03:33 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.17-rc1

These patches enable various drivers used by new and existing boards in
both the Tegra default configuration and the multi-v7 configuration.

----------------------------------------------------------------
Dmitry Osipenko (5):
      ARM: tegra_defconfig: Enable drivers wanted by Acer Chromebooks and ASUS tablets
      ARM: config: multi v7: Enable display drivers used by Tegra devices
      ARM: tegra_defconfig: Enable S/PDIF driver
      ARM: config: multi v7: Enable NVIDIA Tegra20 S/PDIF driver
      ARM: config: multi v7: Enable NVIDIA Tegra20 APB DMA driver

 arch/arm/configs/multi_v7_defconfig |  7 +++++++
 arch/arm/configs/tegra_defconfig    | 13 +++++++++++++
 2 files changed, 20 insertions(+)
