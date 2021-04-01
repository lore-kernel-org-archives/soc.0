Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407FDC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:14:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE28B610A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE28B610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EkK2C0DJrGLKjYB7DAxtKUlLoYupiZDDC+dChk6Ot1E=; b=GSdE/DQ6HbKLDOUV9Y8alCCHt
	B2TpxtVs+Jb2gSVTHGen5zNq+xK/gjXZfpndnn/ZFrZbJA3hOZmqUHYk+uVIh6WFdDZLE1sW1WoXf
	f8gA2bPkcLmLyXEDaGUMlDDK3QkGRNlC57Y4u3WC5C+6IMsp4DLKMLZxYgC/lXwtQlGwM2aqj6v6h
	bF9siAGBcPFjcdHipa5C233ASkiGsFdJVFIO6tJx6TgcEG+xFib+vrB52li61idYtcHiOOWgfx/lI
	ceNSHmmMBDk1kbzlbeW7PAcgiKHt6yy6Fk03vBXT4df8k1Yc7j60TUQ5HM6j/zSeSaJNnbrkOIDBu
	bH/VKHkkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS4a7-00B1Bu-Fs; Thu, 01 Apr 2021 21:10:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS4W8-00B0wR-5M
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 21:06:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0111610FA;
 Thu,  1 Apr 2021 21:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617311175;
 bh=6JRjyfScpf/efWp6V9b8MycI7e5TmvBSvuXzH73BLGk=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MRAcNBewsxVKExQTydH1wcfZ/UPLCrYozgb5q8R64P8UuVCmfvHZMB3piXIL48mZz
 V9ATTySy9X/l2dB02UE+etYnSTH8S59Yq9GoJC6MOgHeVOhaY8Bnnl/BblBNJy4yxk
 7jqizE/iIwiOVvK/imjmWdNOk/dTzS+013iOQgNp++yU9rfojrggmXpdWTEspy4R/U
 LFlGnNeuRjgeMQxRy0PLsYAJzpCwJ55DxYUdAhZ7HRGNpd0JWuLGBNSpW05BnVHuzM
 oIvTzA5O/eR2QFqGf7i2jKC4VdNzGJrhZGpiMtNv63cQX8f3xXddrF5uA/Vl97KN82
 +17EwXlu5KvMg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] ARM: configs: ux500: Update for new drivers
Date: Thu,  1 Apr 2021 23:06:04 +0200
Message-ID: <161731114635.662954.4375604729144576675.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301232050.1457397-1-linus.walleij@linaro.org>
References: <20210301232050.1457397-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_220642_759114_2364EADE 
X-CRM114-Status: GOOD (  11.85  )
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
Message-ID: <20210401210604.qkcQN4KTCCI322CBn_oYFeJZCKMZ2pA8Ft0Kw6lDBug@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 2 Mar 2021 00:20:50 +0100, Linus Walleij wrote:
> Some new driver support for the Ux500 devices landed in
> v5.12-rc1 so update the defconfig to use them:
> 
> - TM2 touchkey, used on the Golden and Janice.
> - SPI GPIO, used for the Janice display control.
> - NTC thermistor, used for the HREF temperature
>   sensors.
> - V4L2 flash control that gives support for LED
>   torch to userspaces such as Phosh.
> - The LEDs Flash class and RT8515 Flash/torch LED
>   driver used in all the Samsung mobiles.
> - FSA9480 extcon, used by Janice.
> - BMC150 accelerometer, used by Janice.
> - IIO rescaler, used for thermistors and ALS
>   on Janice.
> - MPU3050 gyroscope driver used by Janice.
> - Yamaha YAS530 magnetometer driver used by Janice.

Applied to arm/defconfig, thanks!

[1/1] ARM: configs: ux500: Update for new drivers
      commit: 907d6d3e41f960a083dc927350b3b531c43c1ce1

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
