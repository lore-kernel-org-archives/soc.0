Return-Path: <SRS0=RUdi=SJ=gmail.com=benwolsieffer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FC9C433EF
	for <soc@archiver.kernel.org>; Tue, 25 Jan 2022 02:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2127C340E5; Tue, 25 Jan 2022 02:09:58 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FD03C340E4;
	Tue, 25 Jan 2022 02:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4FD03C340E4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id k4so23313616qvt.6;
        Mon, 24 Jan 2022 18:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iTzkTuWEmHmGPDRas9+M9Ndg+E5GCPS0cGBZk3zyHzM=;
        b=MIkGN5P1HpshH3EHw2rOxYu1PsKdP/ZF7tMRkn1zxDQh2/PYgYuU8nX+0dq805ryMv
         sU82DfhERYJpZrdwMxrqlpaIfrAKZ8fN85NtWHulamIW/pbSSReJBABcN4coW9INlNx2
         pXiK9NZu/YFd/c8+Jcu37AYHE09FxLF19FiuH5jUSoHzxSJceIqQPZTsN0Sb4mjlYDPW
         47JpLAzFnoM9dLxQxXoGUD12HKPvdt5AUwUKKOHCT01QekAa663/kmsFaPdOCuIOq9uN
         JzHN2KQaNtcUriBJV5aWumeE6OFbVKzxZFqlrv/hTdgoXxPUsGMoE+b+yXXIC8vV3wNM
         +SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iTzkTuWEmHmGPDRas9+M9Ndg+E5GCPS0cGBZk3zyHzM=;
        b=MhgqIyKdPUPwN1Dar2GtEe9kk/30vDhSMO73UF8P9nCEuybixdYBfiI69+nLKvLVCn
         qPlGSreeaKlOJdu7W1QkHVTdmJd1OnJnFzKcidk0xhMLMBEyJHQ2VH/Y09mTpRsE63n5
         xwpPIPlosO5tRkPYRc9azV7blhQLuXrmPtXr0l6wV/1lP3GaGOVl/ODxYbyCpna8yLV0
         t8dOY7SQ/SGcdhd6ZptsfL5MXIlJUKFRPBxOJ21NK5zIFw/vRGj2o99pPLBrdJFDwNR5
         zbZfi5lZ6oXG56I1+z/lFqHaf5bHf2j72BTXHjwZBhafA7K7Z+eIiZxzoaLqb6hYS2th
         5tbA==
X-Gm-Message-State: AOAM533tXBnpLi7UxUjGComm040ToSQgeKgC85gDOA8qK5jo7uocRHEu
	E0tE+0uvSEhR6VpwT9kpMzc=
X-Google-Smtp-Source: ABdhPJxHqcQbH1+pQp5eK8/FR7Mg7wYzrRVK6Xy9DdVaS8pqKUNOGuUGMbmz/qqqJxhfrfnZMB2oJA==
X-Received: by 2002:a05:6214:21c8:: with SMTP id d8mr11621660qvh.65.1643076597298;
        Mon, 24 Jan 2022 18:09:57 -0800 (PST)
Received: from Dell-Inspiron-15.dartmouth.edu ([129.170.195.217])
        by smtp.gmail.com with ESMTPSA id m190sm8024845qkf.58.2022.01.24.18.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 18:09:56 -0800 (PST)
From: Ben Wolsieffer <benwolsieffer@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Ben Wolsieffer <benwolsieffer@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Add support for the HP TouchPad
Date: Mon, 24 Jan 2022 21:07:02 -0500
Message-Id: <cover.1643075547.git.benwolsieffer@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds basic support for the HP TouchPad (codename
"tenderloin") tablet. I started with a copy of the AQP8060 Dragonboard
device tree and made the necessary changes as a separate patch.

Ben Wolsieffer (3):
  ARM: dts: qcom: add HP TouchPad (tenderloin)
  dt-bindings: arm: qcom: document HP TouchPad
  ARM: dts: qcom: basic HP TouchPad support

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/qcom-apq8060-tenderloin.dts | 478 ++++++++++++++++++
 3 files changed, 480 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-apq8060-tenderloin.dts

-- 
2.34.1

