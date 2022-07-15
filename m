Return-Path: <SRS0=hN7X=XU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4B1C433EF
	for <soc@archiver.kernel.org>; Fri, 15 Jul 2022 22:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1115C3411E; Fri, 15 Jul 2022 22:17:58 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 562F7C34115;
	Fri, 15 Jul 2022 22:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 562F7C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id y141so5760701pfb.7;
        Fri, 15 Jul 2022 15:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v7eQCw9h6+M72311wlKY9Dtm1kWTbrv88zDZZ3zYDt0=;
        b=XJYxeTVlZZH+DZvYsJ2hCrb64cPGUA/uqIU5i8Fpeg7oDUg7Fg3Ga5+JyTAn2TUZ35
         cn3jZDvpUjFK16Ej+YFcg+/1fk5c50J8GgO54S0mevaALn8Wyja9L9UhqgL5vNSvkx8y
         2/+oof4z5WseVrQNZCiu6foqyQGoBTGMC7nLItCt2Zx3yreM27BmQuV0nJycWeSn6e9L
         874fTcf2LUyhscTZpTqthSn5MJxDZTk12bkRJqJwAjWa9K5E0zyhCg0cf36ECQLyKEZp
         l8egd2Sjry7wdhW6gDoFY4JewLEucS2kMm6KcSY3EYRSiLKAyU9Z/SqSvDd8YR/OMHTO
         75AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v7eQCw9h6+M72311wlKY9Dtm1kWTbrv88zDZZ3zYDt0=;
        b=zxdIJDDBGaSBODzjEk40FT/sq050ntVWN3y3X3Glm58F7KmM9vkHOfmX/vC4t+epLH
         4/xYpJJK9BUpQQye5m2L5/N23sTv+KclemSCvbnBJgO/XywXGSyZMWptgwU24+7wQDxw
         hFVOl3ghb98/8oQlxaAPN20SpnmpAYORXL5Vc/4lLCk/XCTHg/cbgAIdTXDf532GSJop
         Gi0Bt68P08JgalO07tnygzXqCFBKDrhC+dCx+LmPOBEcO0DFwQ2As7YwCYjXdWHW8FZm
         0bVDkmrXkgICL9P4/Of8r3EDcoOdqGezYF4+TjKySLaufZXh5peR4G1c1jdItTvQNauM
         ZWCQ==
X-Gm-Message-State: AJIora/5+5f735KSEr4pyIwLz99X9019pqiVZ2h/GCWUap3wxmZiYpQN
	53NuQIyvUFsLBNgqNigYdd6KYaHBghw=
X-Google-Smtp-Source: AGRyM1vAUjZAAxNr91JUaJ3m6b2MXeVmKV3s4Ta6icSPjGRC0cWNu+g/c9spsdfMEocnT4Ipd2yjyg==
X-Received: by 2002:a63:f011:0:b0:416:4b7:5ae4 with SMTP id k17-20020a63f011000000b0041604b75ae4mr13800984pgh.380.1657923477556;
        Fri, 15 Jul 2022 15:17:57 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id w63-20020a623042000000b0052ab8646500sm4391123pfw.56.2022.07.15.15.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 15:17:56 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org
Subject: [GIT PULL 1/3] Broadcom devicetree changes for 5.20 part 2
Date: Fri, 15 Jul 2022 15:16:40 -0700
Message-Id: <20220715221642.297536-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715221642.297536-1-f.fainelli@gmail.com>
References: <20220715221642.297536-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit daf7c850caabe0f12b10d2310a8420fc6e8abd8f:

  ARM: dts: Add BCM63138 generic board dts (2022-07-08 14:00:45 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.20/devicetree-part2

for you to fetch changes up to 76cf72fe5ab6b5fdbab911a800b386bc84204ead:

  dt-bindings: arm: Add Asus GT-AX6000 based on BCM4912 (2022-07-15 15:13:28 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM SoCs Device Tree changes for
5.20, second part:

- Rafal defines the binding of BCM4912 based router Asus GT-AX6000

----------------------------------------------------------------
Rafał Miłecki (1):
      dt-bindings: arm: Add Asus GT-AX6000 based on BCM4912

 Documentation/devicetree/bindings/arm/bcm/brcm,bcmbca.yaml | 1 +
 1 file changed, 1 insertion(+)
