Return-Path: <SRS0=np67=PO=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EFAC433EF
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 695F161073; Tue, 26 Oct 2021 09:47:18 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA76460EFF
	for <soc@kernel.org>; Tue, 26 Oct 2021 09:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA76460EFF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 310093F17E
	for <soc@kernel.org>; Tue, 26 Oct 2021 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1635241634;
	bh=lwt7psYc2Id4VnKMQAjNQXybp8Ipe4Z993o3ysdvm2A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=UHWJqGmPpGNu9JRZLEfGNMg3MuHmWKmmpcZULEbiLixnSV8MKcnc9Rh/ipGmGzgYs
	 LiUb9kowqRk0vQST81A+vbtXuPkzoOfaUT4t9xtXtUvnDP2rVeE16gLDiHwyBDmKoD
	 bvYNAXD3JylkifV+5vHS2WAimfifsDf6v1/ltcU76apnOu+3zQ+jpCdofYibLbRdtu
	 v+4gevguvbRDOW1pTxY99nP/5OL7Q4S4H+mCGemdnilmqDs/SJKWbxkg+oEQIfcORX
	 gOP1DYWLjzOM5odEeh3CvMUcViTxVIhM11wz8IcdKLRJm45Q7zgghBnnQKFt88uWzb
	 PzNdCNBaGZOgQ==
Received: by mail-lf1-f72.google.com with SMTP id i1-20020a056512340100b003fdd5b951e0so6025208lfr.22
        for <soc@kernel.org>; Tue, 26 Oct 2021 02:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lwt7psYc2Id4VnKMQAjNQXybp8Ipe4Z993o3ysdvm2A=;
        b=cIMukQ4Gjo9uZVf6QE25w5T9zE35m1LrmpseNBNO3OM6G1ovbfybsMoaXQhsuFghxp
         OLt8OlguObtKRSItyvd2+SR+ph7sWnUbAEFtnSdI9zqPiz3NTEAu89VtTQ7q1LyUSZSq
         LE0Yp7UzxWYA56rmITdpCFufVoRvkd5s/uB9SwIm8RtcozgQeBERfOy9VaNApa4/UhLh
         C82xxeAr74Uw/yv0JUwQ5b/INU7INcMVE3mUDHOYog9M3oYDYlNl5akx8/NQP9VW5MYD
         hIJE5kmACFv1IFGv+sbwWfOKGycmoOoDil9j/1lVakpjL8MsTl5JDCV5kPEFEu3uKKkN
         aKgg==
X-Gm-Message-State: AOAM533xj3WkZdW6pXD3SAr2VZc/JKGRsYohSozOVKQBpZDiKxAC+/g0
	fk5R2+heNvBTGBcogs2cz4hAclzagr1WIdIcOrOuwI080fB2TZx45ygiOsB6Fk+0vVRB7Qz6ovw
	UsJC9kHivv0xxoOzi98pYZzA=
X-Received: by 2002:a05:6512:3408:: with SMTP id i8mr22545562lfr.16.1635241633292;
        Tue, 26 Oct 2021 02:47:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd4N5qdnZjcm3JgueKSlcmI503aNViTDw74yMnkI8iPyqp/pmagYhUJyj3RegJGUDrzXfhdQ==
X-Received: by 2002:a05:6512:3408:: with SMTP id i8mr22545539lfr.16.1635241633083;
        Tue, 26 Oct 2021 02:47:13 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v17sm113794lfo.167.2021.10.26.02.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 02:47:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 0/4] Samsung late changes for 5.16
Date: Tue, 26 Oct 2021 11:47:05 +0200
Message-Id: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Late changes for v5.16. Except the drivers (1/4 email), these are really small.

The DT and DT64 pulls (2/4 and 3/4) are on top of previous pulls.

Best regards,
Krzysztof
