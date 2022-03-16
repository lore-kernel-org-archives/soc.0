Return-Path: <SRS0=/q7z=T3=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF7CC433F5
	for <soc@archiver.kernel.org>; Wed, 16 Mar 2022 15:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83763C340EC; Wed, 16 Mar 2022 15:43:33 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDB49C340F1
	for <soc@kernel.org>; Wed, 16 Mar 2022 15:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EDB49C340F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 728213F602
	for <soc@kernel.org>; Wed, 16 Mar 2022 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1647445410;
	bh=WBCS6DawBDfIQw6RWubn0SM9D0VeNABoJtOuRAqK74Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=dEjxZDNKlp2mXp3OCoetm+tHCXi4uiPsR17urVflijwWpzdWjZ2txhNQ4A/gDOY5/
	 DtSRx+IaP1OJAfiyqDPJi+UU6ZP4VUNyYwpiohQpaEBi1YWK8uOpiET1O0bYGhWLH+
	 hUn9xE5nC9EqY+i0MpV+qusqXQ/Lm84Ohj1DU3tfAQKLSHc7+S3qW6p20s4XERAvSK
	 ASx6kSEBUqnlbUkuxf6OA3vuP/oGjunRm5bHN+Jksy9MSdGKEQu+vamMPEXGvVel0O
	 s7bOuLIoXpx965N0aor+jlffnnSttXt9Qf3QT1XZ3NreMiaMcfBDij2hZVKuBi9EpC
	 M06CLtBC/h65Q==
Received: by mail-wr1-f72.google.com with SMTP id a5-20020adfc445000000b00203dcb13954so682863wrg.23
        for <soc@kernel.org>; Wed, 16 Mar 2022 08:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WBCS6DawBDfIQw6RWubn0SM9D0VeNABoJtOuRAqK74Q=;
        b=FYc272B7JqR4yxTos+6+U3sgqbjx5HjM3YlvbJu9I73CkQvwUQSEhS4xr3f/ShR7Co
         Os0RrZ2z+u8Zo36OFat/QH5lyHMzIDq3zPDrJzmzx1Pw3+0oNcPtmt+Oi3rj6zmEzak4
         FAX6n5UHcRbiap9eH7W+F/TIwhz6+NZA4mTMj2tXNYLwro5bwiJRZ8/qiWpOj2lvjx5V
         wWj9CCQHOXrJq6Ga5xAldQrzUOxgbV6HIfLyO9VqlfwVtVfwoZNjOfXAjzGmvnvDV82s
         wqvhdLDfSI7hfindvLx64hbqYNsMkeH/Q3vBRCN3Wi6by8lmq/Vzvk/cL6j7YCapOS1R
         aF/A==
X-Gm-Message-State: AOAM532kyoPMRUqhD0EA3ahxh9PYGywMg04perOVRTLyV3D+nptfck2h
	6UYSzBEftteZEFHMhaPQifAkVV6jZ5A0i0+iv/JnKdEG7/XMtLedMO5kh79kWORgHceiMqmc9HV
	zYehxUauAu5tPnpE0SRLARtE=
X-Received: by 2002:adf:f68d:0:b0:203:7b96:a7ff with SMTP id v13-20020adff68d000000b002037b96a7ffmr459549wrp.101.1647445409792;
        Wed, 16 Mar 2022 08:43:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1OWvac03ql0OiQRhb3sPFgprTVanX7mlpH5UEbp3MZGk+AIvaezSa67LY4VRkWA45GmDBog==
X-Received: by 2002:adf:f68d:0:b0:203:7b96:a7ff with SMTP id v13-20020adff68d000000b002037b96a7ffmr459534wrp.101.1647445409576;
        Wed, 16 Mar 2022 08:43:29 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4f07000000b00203db8f13c6sm1918907wru.75.2022.03.16.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 08:43:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: krzk@kernel.org
Subject: [GIT PULL][PATCH 0/2] Late patches for v5.18
Date: Wed, 16 Mar 2022 16:43:07 +0100
Message-Id: <20220316154309.436028-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

I have two last remaining patches for next cycle:
1. arm64 dts patch for Tesla: to soc/tesla/dt branch
2. defconfig patch

Both were already in linux-next for around month.

Best regards,
Krzysztof

