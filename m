Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD05C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 09:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F6C76108B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 09:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F6C76108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XzGAGNsekqDgk3gemBWPnD0XvNc9j2RZgxft8vJ5ECI=; b=QTGQUPltjWtb9b
	roYVU8JOYcvUYzoI7Dg1LEd1hZ5sgNFze/fxZfe0oN/37oSF5Rj2JzdJSbeqGpXyguLhZNLXBYClT
	RGUZhG0OQ38Bg1edCqXzg15ytlHZUscgncakIC6h4iPYRAes6+Igm732S+2rhYfnDQPwrl3EaKEKd
	w0q0Nrk5wfLQPwjt4Np9H5g1O9zf0JL9f/PIco1zmLR77CPUfybvy1k+m8GlpaJg9tWbSpnsMH7Hk
	F6FSR46GhRZ8RlE8YzDHLqBWWtA3lvBP1en8+jWkkCq79V1r1rTPyhaXDgQQ81YNBjDV4Gd3PgS7h
	RUsqO7SQw0GBxW3D4ruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfJ39-001Lvm-SE; Tue, 26 Oct 2021 09:47:20 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfJ36-001Lv4-VZ
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 09:47:18 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DE6F03F332
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635241633;
 bh=lwt7psYc2Id4VnKMQAjNQXybp8Ipe4Z993o3ysdvm2A=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=nNrP4u25DAI04WwABVxLnWHIJGtLAz7UhWIoOqf2c1s/AxNFphehIoZZlTgax09Z6
 DQqrtjowPHwMl+oNFfKAAT3icsOQJmEU/M0zEOOG3b1sFVsG1bjpHl3Wzui6LFkv7m
 nkOioJK91Pft1Tg0+3W/M6BpuAWKkcnEJ2c7+ob8ZdkDp5GnLIAegl0mMkCyYVEtI5
 zsd0akPViw2cOymqGV5yXCM+R5lswC25vubITE3ANrd2cSBtM6zaCyawcHCwjA7XbJ
 9Zn24EU96F/u5d33jGLWvHqADXtTNjdhwX0ZbNnZocgIx1EH8RJ8S84VOoXBmpMh87
 Shr+MrfuBR68A==
Received: by mail-lf1-f72.google.com with SMTP id
 u17-20020a05651206d100b003fd714d9a38so993751lff.8
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 02:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lwt7psYc2Id4VnKMQAjNQXybp8Ipe4Z993o3ysdvm2A=;
 b=p9FNPTUWZcDfnkkA7EowENBSEYqWqCQd5kBNRqkKfYzERhD3NcWpzekpNUTQKMYYBd
 5ueaosXVZqmYkHpu63j2Eg5wniv+9cvkQH/VYyzhLEerjJPOTf5lwst1b/lq2/8Is+6c
 iASwxp94UX9aDR3T7ydv23zmg+bW6aNTG77wYZ+zDNDN7lJNq7BtmNlkVc44jB3+qwnz
 krqcDsEcYkmUyx2wVdlJUCsz1tPUnyZV+uiPlAISXjsmtKkrVFkDV8bEzMy8UxPgWzuS
 J77nmPHBGx8geyPK3FhJPCk2JMNmprnmLXydfW23Mvh0Am2qMUPXVcFsPzwm5rHQtK7C
 SB7g==
X-Gm-Message-State: AOAM530rY1Rzd7jZysR7TNNNiSZbuB9SI/c3Vup6uAy0pteUbPi0KLLf
 cRs7mLG0xjlOUpkzNjnWh3eFjSSeMEKRgy16TP2mGU+ftqyi46dxcO2bovVNyFKryD/WFGspmz5
 4PCay7xohlTvkXP7Htm0ffpZtBx+pj90IKYEm9mVrckw8t6czAD/2
X-Received: by 2002:a05:6512:3408:: with SMTP id
 i8mr22545558lfr.16.1635241633291; 
 Tue, 26 Oct 2021 02:47:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd4N5qdnZjcm3JgueKSlcmI503aNViTDw74yMnkI8iPyqp/pmagYhUJyj3RegJGUDrzXfhdQ==
X-Received: by 2002:a05:6512:3408:: with SMTP id
 i8mr22545539lfr.16.1635241633083; 
 Tue, 26 Oct 2021 02:47:13 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 v17sm113794lfo.167.2021.10.26.02.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:47:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 0/4] Samsung late changes for 5.16
Date: Tue, 26 Oct 2021 11:47:05 +0200
Message-ID: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_024717_188552_E4F12257 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211026094705._I_uaNpXkahbT4xsmslXEuDmyrFgUmdjLPuzewSStn0@z>

Hi,

Late changes for v5.16. Except the drivers (1/4 email), these are really small.

The DT and DT64 pulls (2/4 and 3/4) are on top of previous pulls.

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
