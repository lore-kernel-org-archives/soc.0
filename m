Return-Path: <SRS0=4HkZ=LE=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E87C48BE5
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 19:48:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD13E61285; Thu, 10 Jun 2021 19:48:42 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872EF61412;
	Thu, 10 Jun 2021 19:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872EF61412
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f171.google.com with SMTP id t9so602026pgn.4;
        Thu, 10 Jun 2021 12:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mfkFqsgpL3AznhJI9IfIu+Wtx+Hx/3rGiTa6HqGFLyY=;
        b=Q2RfP2asf3CSsji/OQajv4jZ7eZvHrmOSVgYKF1XxcKCXXfco/GE2qHzeHA80NOjuU
         cC5wghUH/khpIpcLk6c13/MmMj2nDEOHExgQs20C4EqsQV7D2aMWIKRZer475OeJnx2r
         9bm3rAdBeeOwN9+8ws+VMpTIVsZ0BHxmIh8NErcGzFZFZEHqwk0QYGjGVtVmWPKpfV43
         JvZTniRrZMyk9JvZFYoQQhLMG2jEEk6mo3EuT8fVCeJ4GYZKL1NJlq3aoMD4KTy9ETiv
         WflaB+AOFgkoQCPO9fsAQKeecz2t4bvW5Fd8gBV11l+UhHKvnr7UW18VFUNY6z0kHE8B
         ivAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mfkFqsgpL3AznhJI9IfIu+Wtx+Hx/3rGiTa6HqGFLyY=;
        b=eeEh4NE92gEm1/AiO/Qw0WIv0UfzpaWLbC3CWqvnNBcJuZX29z1U+HjbPESjhnzI8m
         7AsxAURThnLXCTrHfFkpSi5WYhT0l0LB6yAkWGF45/txKqU1nqnMm/sn0ulsv6tu4+me
         bbNxM7j+V1wx3v+dl8T60S3hb87sBMNugi6RbPZgnKQE9cEQA9rcOoTABqvDVLhlM2Pl
         uYk2ojYqES7BTO9PIO5DRM0vLMiFqTdDDCudK3O3oKOm4yi2gIBhO3W3Zgq3XQ9+xq+b
         UYC4ubrsMbIqWyJL4Fz+zzK/XNc+WWy8OtIkHIMW9v8nekPhEoGHRQJANt2iJvArtx4Z
         ertA==
X-Gm-Message-State: AOAM532Mw6b+c+8XY5FHkqRMBhd9IMf6y+IxqmK2jyGsRA8Omk1Xx3/M
	I4qhO8P4lgL4nM4WhIfH5XjKvSTluCc=
X-Google-Smtp-Source: ABdhPJz+YwXnU+AdVmm62TGrYUB+6Dn54dkO2OBKuW4tVu1EN1D2o2JGb2ojoaD+3TgsJzFLFvyyng==
X-Received: by 2002:a63:7e56:: with SMTP id o22mr64617pgn.278.1623354521803;
        Thu, 10 Jun 2021 12:48:41 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id oc10sm3118297pjb.44.2021.06.10.12.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 12:48:41 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Zhen Lei <thunder.leizhen@huawei.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.14
Date: Thu, 10 Jun 2021 12:48:35 -0700
Message-Id: <20210610194836.309869-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610194836.309869-1-f.fainelli@gmail.com>
References: <20210610194836.309869-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.14/devicetree-arm64

for you to fetch changes up to cd49f71cff8de325c7602bb2d072bc6d2807387f:

  arm64: dts: broadcom: normalize the node name of the UART devices (2021-05-20 11:45:43 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs changes for 5.14,
please pull the following:

- Zhen fixes the Broadcom stingray serial node unit names to fix a DT
  binding warning

----------------------------------------------------------------
Zhen Lei (1):
      arm64: dts: broadcom: normalize the node name of the UART devices

 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
