Return-Path: <SRS0=cZg1=WP=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35777C43334
	for <soc@archiver.kernel.org>; Wed,  8 Jun 2022 09:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D4BBC341C5; Wed,  8 Jun 2022 09:31:43 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 833CEC341C4;
	Wed,  8 Jun 2022 09:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 833CEC341C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id bo5so17875750pfb.4;
        Wed, 08 Jun 2022 02:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=65LE6I8WsSEMjuUc9cuIEQxQq7ZjFCriaA5kPWHTjVo=;
        b=DFJScKplEqxgTdpA6+nuZrpggSPsZ7V31yWDcH3OBZcq/cfSLObLR4QoerFGy+QB54
         Yr0FwO0MS94whKG3Dji9J+wDvgSxM5abD4r7w5JsMMvwNFNXr5SV0dRHzLdcZ7AFBZiN
         60N+h/qHdFMysd2MlNG9U59EFvGaj0aXoxxQA9Fi8lTwAmQPf+XUBsAcmrHskBaCvvxt
         y6iCPPPXedDTW2icBRrbSJwiaKt5c5Vgc4JSPuhtmifoUsYJIf6j93syh/ePHRbeg2+S
         H1osNHB/aKEv7uKH3V3/inOYq5GSlZnVePD6syArt+41N3m66SKhG7w8oSjPmHo6pMKX
         pFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=65LE6I8WsSEMjuUc9cuIEQxQq7ZjFCriaA5kPWHTjVo=;
        b=d4yadkWsD4xzUChFn+j+a9C1hk1oFmdyc4Liwgz74is4lnBO4/SAu0QR/XcY7StCoQ
         1qK8BmdMgHgBhzsvDtBlqhYZLsi/a8IOoUtjNdVPDEL7q6eCVsP39v+iCYOfaqJz75J3
         q4v1kvFIbxL9TqNo2whtLaUnJ6j6fwyNai2YYAf3up072x4IYZdfLB8MrxDIjUTrW9X2
         0WfCQQwUA/5wiRUgdRGi9Owx+gAmAI/HL1n+C78iBHmQVIQpMKOUfEAu8IEiS1CeY/dR
         MXVhuxaNy4wTHUMaaoBySw5HrLm+wZ96Ho+mjwllZ7tYcPTBXj8AqoIFrEWi2pP1QIbT
         xLTA==
X-Gm-Message-State: AOAM53290yIZsWgbInxnI8wPGMfVM1V/i4yZfAbFRDhGczPpWTIpjXD5
	aIc7oNcfzlo6DEqulPgd2KRJuJKXj6YQjw==
X-Google-Smtp-Source: ABdhPJw41pQldrWFl5gjx0Vz0TqFx0aYJ7HKqw5fAnHNL8AWI5ONTYqk5LZntVLXHnjPuQxnd//pgg==
X-Received: by 2002:a05:6a00:1801:b0:51c:1001:6241 with SMTP id y1-20020a056a00180100b0051c10016241mr16655121pfa.81.1654680701420;
        Wed, 08 Jun 2022 02:31:41 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b0015ee985999dsm14320084plx.97.2022.06.08.02.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 02:31:40 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom maintainers fixes for 5.19
Date: Wed,  8 Jun 2022 02:31:32 -0700
Message-Id: <20220608093132.1465703-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608093132.1465703-1-f.fainelli@gmail.com>
References: <20220608093132.1465703-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/maintainers-fixes

for you to fetch changes up to 46d6e11320d21dc40fce229ab3504125847de27e:

  MAINTAINERS: Update BCM2711/BCM2835 maintainer (2022-06-08 01:00:47 -0700)

----------------------------------------------------------------
This pull request contains MAINTAINERS file update for Broadcom SoCs,
please pull the following:

- Nicolas steps down from maintaining the BCM283x/BCM2711 (Raspberry
Pi) architecture and designates Florian to take care of that

----------------------------------------------------------------
Nicolas Saenz Julienne (1):
      MAINTAINERS: Update BCM2711/BCM2835 maintainer

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
