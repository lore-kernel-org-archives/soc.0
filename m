Return-Path: <SRS0=ak/p=LS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321C7C48BC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jun 2021 02:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E428D61263
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jun 2021 02:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E428D61263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KF2vKtS/yqcnRexFhf+m9Dqb4nsJfHN/16jSZoLdpUw=; b=GKu9tAYFzUpMF9
	Du3lgd0JdpsvOZH+r8shurUnwV4DIuknWeWii/JhOmEmvlTR45qct9g67dqKBmIbWRdekpHbVjv47
	axwUMLjytpmKkWnFS+0NT65UUUYK5UKz+pINuS3MZrmn0e7HE3cXb1IOwS50CSdrpXCIVMgMIR7Px
	PJeWZco2WtZF/shPgzj9cCSIkTQ4WroLkhtWVlODDm4Ih6XIildD7qstSx4K0AnkahSjyenc0Py8v
	OEsG3/2ifwPpURUgxRQXcZIuAZZzhXa0nLWnTaNc1Iz3baSoYP/KF9mfjU0oq4028cXZAgc4fjsqf
	1rwv59svbA8/sFKaLdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwEgA-00CO3o-Is; Thu, 24 Jun 2021 02:01:18 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwEg6-00CO2p-NG
 for linux-arm-kernel@lists.infradead.org; Thu, 24 Jun 2021 02:01:16 +0000
Received: by mail-lf1-x12b.google.com with SMTP id a11so7384281lfg.11
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 23 Jun 2021 19:01:13 -0700 (PDT)
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
 b=jJM63F/24+o1nqfj+xAoAvGJsDSCBhUD8zcQmBKWwx5QKJUg4W3hGEfO3ZXS6/fguP
 jbgR5vNXdiwX3JVuKaqhXhm0dcBicT4a/1uIvBn0Q1a/wbiRhU3BHW+YMFIPgidOpv8I
 jcdasJWj9AW8YKIuuFOnVmVimvDL1wIv4BY/xjRDEnloOzPqftK0YXE0Y2Qi+i1MUyZc
 xgTbttR92GJ2M2ysiJUS5/m9O5nr7PqlrMrNyGl3qgRhrUMWTzLwpxwjpqmmdYvOgw3o
 1GhpzB0D8uI5fOSNItvxUNzDHN1Bc9Plioc9wYjCAGI0ZSvUWFG+qYE3U2oNFyzdZyq6
 YaGQ==
X-Gm-Message-State: AOAM533ev6eNpHZ5FGWq8SUd/9qx/VEjfmNQk8gAsAC3fQUmD95OE8qo
 +AY07/E8bs9NamHLU0P4QYkcqA==
X-Google-Smtp-Source: ABdhPJyGG2jGkaKHEBj6nJanYsd6zVMqTW0lHIUCJs1MCNUhYI3ethHzRudJDJlxS0pVTkBbF9rN0w==
X-Received: by 2002:a05:6512:1084:: with SMTP id
 j4mr1864919lfg.629.1624500071976; 
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
Content-Disposition: inline
In-Reply-To: <87eecx0w6s.fsf@BL-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_190114_855175_42E1B828 
X-CRM114-Status: GOOD (  15.75  )
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
Message-ID: <20210624015633.9x-rsg07ETSKEtrZYG-0H3_LylMsIli6rdvYCcyDa_4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
