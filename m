Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24799C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:45:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD01C23AAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD01C23AAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8DcFGbKK4yIr846/UCcW/FGEc99/9RikOsgUoKrQQQ8=; b=PtrI9OlIrqhMV8j+SOY/IlIXO
	aeigpkr3Yfky9ycQGCv8SfWvJFeVsdV784LBEHfKSYZFO/7oJmbXA6djimJ9sNyKuAph6Nd/Zurlb
	T9JZcQblbQnhpU87/b0NW1h3EgdUVXqP8N6unNl05fpHoIbZJaoc64yHzVFMYMJ9JoY1Yc8BtsfKV
	XBkZqVgPlNcML/AIgkKAD7ChJeTc6wcib7c9LPp2MTzjO/ZEeohlNokl3YkBd8wfs57w6cit8X+HC
	NNeCkRDzv3cHu+fe+2933Wyfg9INdJZ/On7ZQb6XhrLilutvV62xSrrhQMfBaPlYcj7J+ZcJykQkX
	ccWVed37g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l359n-0001nT-O1; Fri, 22 Jan 2021 22:43:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l359c-0001lv-WB
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 22:43:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86FA123AC0;
 Fri, 22 Jan 2021 22:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611355424;
 bh=lIUCnRg6dYAJCci9bt5hPR4IqWkf7HhR8SiytZTy/lI=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rNVQlw2MsGLvK6SCIOVp76zzOzpE86VLKn8730JMCARGuTg6xDAyTospAxj69qZdj
 8XXzR0YcXZSYCRv+VzC070A/a2hof4jqkob3pe3Z7O7uh5aAEYhkSiuOATpszJEe3F
 zOk3Rd0Qp7NBiU4a841QaMTD/76vdXBL+JJIOwvSrWX/iUWXy6QJgYunTW/6IRPxEY
 LHDirmAGXgFfJ/UeHbXJyUPqkWBIFaxEigMkt/PVVeAedzKrw08wBoURhD+X6AqsqB
 IKEwEzrS+fT4sgiKPWw2bO871Vpnx9zzoKySnMfCosanNiMi5duca3Tii7k2oPapFQ
 gro802w/n+WPg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 soc@kernel.org, arm@kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] ARM: at91: dt for 5.12
Date: Fri, 22 Jan 2021 23:43:32 +0100
Message-ID: <161135518031.1310202.4648608354529852901.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122145056.171283-1-nicolas.ferre@microchip.com>
References: <20210122145056.171283-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_174345_118090_FDA36603 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122224332.mKNJxbKl7iIj_w8mXWQ5bNi9E0n4P9KwGgaigPkHJQk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 22 Jan 2021 15:50:56 +0100, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here is the first batch of dt changes for 5.12. As for the SoC PR, I plan to do
> another one by mid-next-week. Tell me if it's fine with you.
> 
> Thanks, best regards,
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8a4e89a16aa4b11711ba01de180c4e29cb5d21f7

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
