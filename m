Return-Path: <SRS0=9ZNB=LS=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE6DC49EA6
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:01:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 01981613A9; Thu, 24 Jun 2021 02:01:14 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B022161263
	for <soc@kernel.org>; Thu, 24 Jun 2021 02:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B022161263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=olof@lixom.net
Received: by mail-lf1-f43.google.com with SMTP id k10so7354958lfv.13
        for <soc@kernel.org>; Wed, 23 Jun 2021 19:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=19HBJWHMQyxDiRvqKGBEFDqxKqhNp8Mx2Tpeb33UONY=;
        b=JmJFXA6L58I452WrD4ebIr+r0Pukq4y3LgY3UreLvGERGxracFG8UmZk5sBWYtbfCx
         KsaU5FZT4xZzqtDVbf7fyq4hc5S1M0++UG4XuO1LtvO5AOIQ6DjscdTwafuRkt2Z24Vw
         Tt9jw6byC8i0QQOynEKNkIYQqaiB993k0DowufhoHm6PbNIsqGfVayVUYyNZheHpXesH
         7TUg46nHECk3P3e4qZya/523yjlKN4RFcsSrAy1GUfAtRjmjaPNRn2ApPT9QA1iIs/Tr
         gZh9cOq4ro6Ihitfj1vK2TDKDpKtNNrRQ0VmWKsYuV+ugEhhHRpr/VW1usi0cOrZjh0K
         xz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=19HBJWHMQyxDiRvqKGBEFDqxKqhNp8Mx2Tpeb33UONY=;
        b=OdKFEz8U6dqVYhbPuEQG6XsKZ2t6qA4Awc3wf0cn+Mo2mE4uu0qR1j/OZB71uzNMtg
         jSlZ7LMG8aGDr/VQ6goSZna8mA30I93aYX1uTzayrgdnF/wThhFlxkbhSgLN4+ZGlthJ
         hj3WECey7ytuAZ6RB8HGIO8Pzt0V/hce1Nz8+Q3AGHIhHrMAH656T7EQlBCyzc7VIL/F
         0Wzrt+8t6wArxHCABWGia5+gJhqurBrgmKvar+lZ8B3JGvqOZp45fp1jF5oNbZkiaXUV
         G/tgwZIaDKh9M5NWlzPzYi+eYUsK3lu43/vIB3gLYA1Xl4xbYijN8rRu4EvnFO5xJKOt
         sgNA==
X-Gm-Message-State: AOAM531o7BPLkCnRLNc8f9Wyw3YkMNdKpq9iKTkx0pJMAOC0++AM2gYR
	QnRopA+kD3HTpIo73rWT0gmGiw==
X-Google-Smtp-Source: ABdhPJyGG2jGkaKHEBj6nJanYsd6zVMqTW0lHIUCJs1MCNUhYI3ethHzRudJDJlxS0pVTkBbF9rN0w==
X-Received: by 2002:a05:6512:1084:: with SMTP id j4mr1864919lfg.629.1624500071976;
        Wed, 23 Jun 2021 19:01:11 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id x37sm65496lfa.265.2021.06.23.19.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 19:01:10 -0700 (PDT)
Date: Wed, 23 Jun 2021 18:56:33 -0700
From: Olof Johansson <olof@lixom.net>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v5.13 (#1)
Message-ID: <20210624015633.GA19649@lx2k>
References: <87eecx0w6s.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eecx0w6s.fsf@BL-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jun 20, 2021 at 10:36:27AM +0200, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v5.13.
> 
> Gregory
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-5.13-1
> 
> for you to fetch changes up to fae20160992269431507708fb74c1fd9f3c309c1:
> 
>   firmware: turris-mox-rwtm: show message about HWRNG registration (2021-06-17 14:55:09 +0200)
> 
> ----------------------------------------------------------------
> mvebu fixes for 5.13 (part 1)
> 
> Few fixes for the Turris Mox rWTM firmware found on the Armada 3700
> SoCs.

Looks like these fixes were posted in March(!!), and obviously can't be all
that urgent if it's taken until now to apply them. Doesn't seem like a severe
enough regression to go in at -rc7, so I'll queue it for the merge window.

Thanks,

-Olof
