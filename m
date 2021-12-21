Return-Path: <SRS0=MANq=RG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DED1C433F5
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 22:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF49BC36AED; Tue, 21 Dec 2021 22:06:53 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80B1BC36AEB;
	Tue, 21 Dec 2021 22:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80B1BC36AEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id q17so291834plr.11;
        Tue, 21 Dec 2021 14:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qlN5sFxeGh9vwgbyLCZ7qtiG4JXBNwGvk7KKHHb3a8M=;
        b=akqok5Y9zX9+UpV4P1mWcCdcaz8/mBmd+9X4wolXiKPq/CggblVDkfRkwTYLFkox+T
         f36Jv9hG+NfUEcThw0Qz55vRG6l5DnvtbuILL2TFpt3Z2/W8VLbbCYaBSHL65rBaENfV
         rYwKmKQTen0eKtqxrLKFMHhMlZr90e2CreEbck7Wzl29XYJjtdoUUppeum7pks2Np+nl
         fsLr4XBPTUy3yrG4gLdy5xb2UVIc5ShpQUWBAxYCAYAmDaBdzcJyY7nv2OVh/oEbhc2W
         yKy6FaI6pTuGjRSKYcOXR/d3+v0HueXl1pxOqZ4Wcq/Jc1JJSG2p5HAu9bYLypqlkW5U
         cNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qlN5sFxeGh9vwgbyLCZ7qtiG4JXBNwGvk7KKHHb3a8M=;
        b=LdAoeeSpI3b6n6aQJfQiuvgLBLpNryvlpbRjm22BfCj1h/uIgxXNkMkjq9zjz3odiG
         56bKzVGDOs5xpJ7fH4xVfsYTkFOO7qe0poa0E0EcAzx4JHt5LyhSRsCPssGmjRbbcH7+
         KBB41Gmb5p4g4943eAkgEpVj1bU2rN4TLvkMPPfqY1gFqfHdBb5hSMmYz4P74vS6gj6z
         bXt+S9NU7DDH4TCdkoWLH2vzLoYt+t/kZv2HlVec7GkVSMlDc/Q+TbIJM73XKlpKOk+8
         2W53djKv9zsk+oqibGzLK+ksrfshBVcIP1ImyWt27F9isHhPPKJtjXtAigY9cft0rABk
         Fv8Q==
X-Gm-Message-State: AOAM531MdTXpfwAcl+7iiSEKRatrhyQESEp2NOhmIln0g0SzqOoJlO70
	I3WOSeNp4g/OkHaPR2Rry8enJJ6o1VM=
X-Google-Smtp-Source: ABdhPJzClRPjEgn+VnsUL8Li+2Vh0mU8xMinemv/f7tXl4UCv/0L9vlONQXIQfqKyfdQQtbBui5JaA==
X-Received: by 2002:a17:902:8214:b0:148:e748:84c3 with SMTP id x20-20020a170902821400b00148e74884c3mr48888pln.77.1640124412687;
        Tue, 21 Dec 2021 14:06:52 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q190sm70342pgq.38.2021.12.21.14.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 14:06:52 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 6/6] Broadcom maintainers changes for 5.17
Date: Tue, 21 Dec 2021 14:06:42 -0800
Message-Id: <20211221220642.2862218-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221220642.2862218-1-f.fainelli@gmail.com>
References: <20211221220642.2862218-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.17/maintainers

for you to fetch changes up to bfc3a3f93ef7d48879c4b070bdbb6b6a80c06365:

  MAINTAINERS: Add Florian as BCM5301X and BCM53573 maintainer (2021-12-01 14:17:58 -0800)

----------------------------------------------------------------
This pull request contains MAINTAINERS file sections updates for
Broadcom SoCs for v5.17, please pull the following:

- Rafal updates the BCM5301X and BCM53573 SoCs sections to list Florian
as second mainainer

----------------------------------------------------------------
Rafał Miłecki (1):
      MAINTAINERS: Add Florian as BCM5301X and BCM53573 maintainer

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)
