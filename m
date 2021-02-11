Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30896C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:02:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAC8864DD8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAC8864DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VLAHtl/HGJPQFsCndymwjwBTvSkNEOTb8fEJO2vVykI=; b=bI5j0mcrCasM+To5a8bmBWett
	pr7Htc3mvI+b7QrqXDoAg6kYDzROcxujJNW7l8kCvQ16mcMgSALUamUoflXSXxvKdTGz8uPzRX8s5
	zmSWpYl8w+2Pt2fsFbP7EKnJe1md9hUtIyViykqKaSA0oKnDHisKs36UrezHbXpOyvPMy95THkOU9
	c7eenhYju1j48CIvE1klxb58QJWtzTLVc9s0jyJYs5GBGTmLFOAXcPW2wB+rWz0nXi27HdwXFYupm
	GrfUXpO7TAUP4HsclWArl+9DWTIVgw0I7DB2wKXZuOtWUPC24LxoGYz8Ztfkc1rKhIQ5Ws2wNBFUh
	RfL1vWu6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lADSu-0005I3-2F; Thu, 11 Feb 2021 15:01:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lADSs-0005He-KH
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Feb 2021 15:01:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3989D64E7E;
 Thu, 11 Feb 2021 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613055665;
 bh=X9UqADU4J8H3kIOyPuFf7eWbCck6q4pQRHXpDS4jmlA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oyn4pPI2M1y4Ah2UElZjGLQtDOuiLHAPYfv9JypgZG0JRxFxN8jCR5hik0JFGITc8
 CdcOkG/bui6Hc5ovBaVXs/v4Q49RedFmEgOEKHio0G+ySix8AyveCbOG5ynN7eZmA2
 nsWBTCnyJ2xAMcF8fkn3/+xMDkPuxLS9yTpkcACTJ3B86BV9apRCeHVzH/QlU2cTjD
 HZcaZ4c75Jv7cU1cD9CB0Je5Gbwi9AMXZb+qOcxiKXNJR8wVb4heROqbM5lnBhJfzz
 cQm9SjjUJQijtXvCXblwihONFBYYOzHpI6275WKi98e3o2+yXn3R1qPBzjU3clqlKu
 OfT40EBy5DF4w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 arm@kernel.org, soc@kernel.org
Subject: Re: [GIT PULL] ARM: mach/soc: samsung: late pull for v5.12
Date: Thu, 11 Feb 2021 16:01:00 +0100
Message-ID: <161305564880.259023.8415922783471505237.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211082254.7934-1-krzk@kernel.org>
References: <20210211082254.7934-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_100106_731604_0CA4C4C9 
X-CRM114-Status: UNSURE (   9.94  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211150100.Ojgwag1jkfoe1DvyavT2EnAIwaK15JZZ7LkLV6RHArc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 11 Feb 2021 09:22:54 +0100, Krzysztof Kozlowski wrote:
> Late pull with minor mach/soc fixes for v5.12.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/soc, thanks!

merge commit: c2bd78de41fc3bdeb183bc24bbb2c4c0f3cfdb9a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
