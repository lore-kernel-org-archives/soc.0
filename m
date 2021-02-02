Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03005C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B676964F4B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B676964F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dqEupUCR9ZaWlm19/xE/bWqFcEDtHf0avfpX3U6nCsg=; b=aI+I1hpdMRkjVoBUFvCuz3H5Q
	LipeH5uzQV7apEOsfXE9oaQ4v7TIPUSFcU4GJ5VngPebeihu7YaYsTcUbKG56BGJcuXx1wuwzIS/f
	wFWWAAqH7RG9oI5F0zu9m4oWKOowPVGrJXrKVGJT4JCqBiYA4NPPkDGHCZrRTRntT5+ylxxQZUA5R
	gzbXRBJrbMgdRPyNIqf2mPjIBOP25Ko8fLO1Ia+3lvzqWga5zM3HNje/4Cit1SYd2NFSj0b8Vj6Xf
	zcCP0TQF3B96RAOQN1jGYYCcUoAKZy+lXcdsAow8bcZdyf5YY8TSX8EKfUed8f26O9IaOedRVOVIA
	iFa9kL6MQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zCF-00037s-Q1; Tue, 02 Feb 2021 17:10:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zCB-00036B-0c
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:10:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B181764F8C;
 Tue,  2 Feb 2021 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285830;
 bh=RDAJBs7hZAG5GvM978VxZJpSkxhRuZNwaO6Yq94kChw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vDaHzrjDb3AGR4e5b34K6gS00qljX3gLNowscx9++KNcpdMLf56srrZmgm+5rKt53
 c7kOaA0sG+5Kx7nwgqEYCH3YHspzic1cJpibp/ayf3x5A8csdX80uBnzJ4W+0KBIDY
 dPQwc2MDDXk6vq6S7BHQFT251BCNh+XaMTiBsp1guVnoO/8Qx8fZp3zwoEJvQSwCJm
 XgESIclHh07vizO1OVvcJUQ/1sgD42svxsx5vGwXJyvi+FnXHADvLfJn13uygtG84K
 GTO0mPmZo2GMT1WWwxGEyJsLOR35Lj/ZaOFLra5Xoi/1Tyr3BVjMC8CJET74CNEjSX
 xuLCv29AbrFTA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.12 (#1)
Date: Tue,  2 Feb 2021 18:10:10 +0100
Message-ID: <161228552314.1852435.14453137896753476944.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87sg6fn49o.fsf@BL-laptop>
References: <87sg6fn49o.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121031_172083_7837A6D8 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171010.tTo5RoZzYap0cwJ5BzShXOrky5rSDia38X-mmFvW0v0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 01 Feb 2021 17:26:11 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for dt for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7e500c897ddf99f9f794a1ff80175a3a18547095

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
