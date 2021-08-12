Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D059C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:49:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5E3660560
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5E3660560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fam6aIcQ8eRXDFjJ9gLQmbSXEXyK7TKGMY5wdMz9Dqc=; b=ab4yGZtMgMtZWv
	l50OXoUPi2mj147hkHGq8y8OC7v6YgnIqaViGwiHnE211d8cTKFNbexhKqZXk7NQDkUNNcj9+2jDQ
	ZZ1ulJoF9nN7kNCPSvZpgDJHsTPbwSxnH6l9U1dcdVOLlpV7G6WayCeEOihQOESpJ7vIMgod6S/XG
	8WusEfOtO9/yaDTPrPZlpnYXCOYuihm6gO50+ggfF6Dv9/zFi7bfayiRz4pF4k1xVszMLkdNkY8uH
	YX0Vy07xtHVVApJTLBnLUpfmQYAeeEZN8nXWTtuXed1oEYSveQ2kAzFW0sKFIHnuIbFLrzsmCAzzN
	kzhWV/5kthXqCTftyxXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHbg-00BDvC-PA; Thu, 12 Aug 2021 20:47:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHYk-00BCaF-Bx
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 20:44:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B26AD610EA;
 Thu, 12 Aug 2021 20:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628801054;
 bh=dGbtEwIfkRj3qTxeh3QQZJYMta1Yvfy9I6/Wj7nzINQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qRCUsYWOy2LO+OYWrdAUWUxhU5wxjbU9R6N6qomWB3u9W8RHmczEHllcc4K2Zlbyl
 99/WBlqvSQti0a+pZNYHv12bmEofcsNm5utdkir5I0fzcTXWiviZASjRX0gFry3sUK
 MJjx5ndDHlG5ieS5hXwnUM6t5a49FbA3Tqu2vTg7n5dj4fMx++YB1PMXC7XTuR0pke
 3qvtIODyg+DbpCEYQ9F6dIVL+aJ9G8sozgFQmHRC5dfR7NYLjf325qTUoPM1d74Zo1
 hgkUaEJjH1t29RL+XpghD+TqzIQXHGd6vrmu1Ot599vbNQQtTV838X8g8jCNODdxuH
 9VdJ3PlpnC8Ng==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] bus: ixp4xx: return on error in ixp4xx_exp_probe()
Date: Thu, 12 Aug 2021 22:44:01 +0200
Message-ID: <162880092600.1372486.9999578242110413401.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210807230016.3607666-1-linus.walleij@linaro.org>
References: <20210807230016.3607666-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_134414_468302_8EDAEBDB 
X-CRM114-Status: UNSURE (   7.67  )
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
Message-ID: <20210812204401.-F1uBF1d8kQK6yvxHVBhK3X3_T_8YPh6jxbOsRJYdEI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 8 Aug 2021 01:00:16 +0200, Linus Walleij wrote:
> This code was intended to return an error code if regmap_read() fails
> but the return statement was missing.

Applied to arm/drivers, thanks!

[1/1] bus: ixp4xx: return on error in ixp4xx_exp_probe()
      commit: d2c334f49c8305ff8ce31ea33183977a2935ba55

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
