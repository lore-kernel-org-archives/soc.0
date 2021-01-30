Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19347C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:26:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B342864DDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B342864DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Znws0OZd/hhMvxNpxWXr37wbliBfQiflRqQShU0Pf2M=; b=S0NUE8kz1u85fhpXPH4dSyosq
	m8o30QuAI1dOZo85JaY8y5aOAcpTiFtA5hYuNwEzI94suqB8VW1kS3riIAqN7OE5grbmTl9co98FP
	HjzKYey0x81ZbL9DeDbtsNz1OmcEutVrz0Xk6doPOhbjDXWvAxWL4I3sdMp4VPaLId2KBqferx8Re
	WOfooOGhm4yQv0tLWQTrS2U8CKRvlL4gK5Tq+3iTMC88jDoyNCrDhAU4bVR6P4J+X7ezS5FJJkuHu
	/n/ah4jhCUSDR8wBSroFAdoheaB/z8988+5asKQjetHO8N4rr0/s+VdNGKWrS532fDifPYvb4JE0B
	6eQ7F+oaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oNJ-00072Y-Hz; Sat, 30 Jan 2021 11:25:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oNG-00071q-6Y
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:25:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE4FB64DDF;
 Sat, 30 Jan 2021 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612005905;
 bh=Cx/wV+Y/fgtydB153xG1RMAFwtjtQQZMqie8uEQTpho=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kXldFouDDSljdXXah2p6lu1v92loEQHvo6ULiwSZjlLpfTL5XF3wLXBx1i5WWlZXb
 oadVTgVoLcIsl79rkb0afMy4Ih7p+xrh+88szlVprx0UNUY+TrB849GFzNl0Ng6Q0I
 fR8UwWJVucuFpdOviwccq0JpU72qLEJfCphUie5/78ppnycOrOE5/cQtEW9es8lLZe
 /OWNnjJTp7Gsmar0F8kAax8TcbEZ5aFtukJw4MlT3S4KBJggU8ZpgLu6VlrOzI2A7k
 10mCuHXUDWKqWI92cIVrdEAVitBhr931lfi0/It979/ousAzhxUd06AQmLrs9Mq45v
 5ATM8bJl2zygw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Philipp Zabel <pza@pengutronix.de>,
	soc@kernel.org
Subject: Re: [GIT PULL] Reset controller updates for v5.12
Date: Sat, 30 Jan 2021 12:24:57 +0100
Message-ID: <161200588866.1995370.6659304756660517573.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129153108.GA26994@pengutronix.de>
References: <20210129153108.GA26994@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_062506_327559_D2306461 
X-CRM114-Status: UNSURE (   8.57  )
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
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130112457.OEpAdtlPEAm4614vJNzb17d8mslCFBIQLutsJ7j8dWw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 16:31:08 +0100, Philipp Zabel wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.12
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 7cc623b85aef7a336152f5cfc28ef5622ded1351

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
