Return-Path: <SRS0=QZdI=FR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614A2C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Dec 2020 16:26:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 182BD23359
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Dec 2020 16:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 182BD23359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jamieiles.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7WRJKyEm94bgLgwakGIpsd6EMcg5jRVWSrPeAdjcMHo=; b=s8jS7+qcsDtKA6V0o8T0wro9o
	u70TkNTVoxu+KrLTE4z3mFkN/I5BsautfGPV8pr9xxftzqHdcDMc4bOC43+uA/m8TGW5nbPVPgegT
	ETLeBEiTA8l4QU+Vv3Qak8vhfPcIzmZ4oCw5bGeG8i10NdH+m1v5na2QNBPN3nCcOfv6gn63tTVOY
	keR7bhu5ySRKg8yoIpAskTJ3NXwLBQjjSp1+yZZZNupuCeI7MdEAbXHnNIA9kkHGcmW2xkG+4HOEc
	/EI5v9/N6lTTcMPq+e7xBJChwe+0ThdE3kqbptUbzRhsXCbkLEesa24GCqw81uLqkWIz3hlHDdm87
	seDvJiVQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koUBi-0000tN-J0; Sun, 13 Dec 2020 16:25:34 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koUBf-0000sc-6n
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Dec 2020 16:25:32 +0000
Received: by mail-wr1-x441.google.com with SMTP id t16so13998232wra.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 13 Dec 2020 08:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jamieiles-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Rf+b9N2htku5WJ9Hu0NGJ+c4uKlPgFBYFEnRhIM8Uhs=;
 b=S2Ty7Lhn1rwak6hdqcbPARjAEnxxvMgu6mXc9eqNXbZ4hVjaGEqQB8pMUoe4zTi1a7
 9K5iVrrFK26itWqBcEUcsB426J87wE6+0bdUwlzGPyaQAK7WJ2mi8EEN38iGxMFmnrsP
 RvAbxMjbqNfxeOib8SiOEhiZQlK2QiETI6lZECSO98DeQC4x86MPTvAar80gTr8fHlo9
 Me754RKBSGlMI4siQAk6QGOOJKPhpOHTAHbm+6yPlQO+KD153S9F2Nau3c/43mdt5Cbk
 efxE27ZeDqsyw9BQh3/7tvmX/sjx5PrOfXZJKnEygqAclqItBdi4Ow5kpP0d/zx2xj9h
 cClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rf+b9N2htku5WJ9Hu0NGJ+c4uKlPgFBYFEnRhIM8Uhs=;
 b=GpC5NIk6iCC+XSGSO2nGEteWTUcKvOjMEzAJk0xbVPlolZj5AY4DR5q8QNCml5FMc9
 t7p8aYrNwRRVzec90wPJdILjPxQEHt0OarFgvgRRPXmlkzARFBLRRXUzUaHxvU+bMktL
 YvuoUC+URdqhMdC2NcVVoEZEIYlrmvHfU+mDr68R70izV5N86F1epkFQ3wKiDIRlpsKB
 fUJQNN8aL/mpWEwv7veiuApZOKnaCttpRbMwQwPU0a+OOl415WKARCd2od87NvD265Fd
 QBEEDIGmSlGbVomIwDonJH26TgNnfojuAaZ5Qti6Gt4mhIlLN/AXpXYkPEJGrjaAk5gO
 q6yA==
X-Gm-Message-State: AOAM532XC6Lq1q36kGhEIGqmsSNQzOFivtaRbRZOjfIenFtoYJefgN8k
 gUcZvRLBREUmqjN9DmjwgxeIWw==
X-Google-Smtp-Source: ABdhPJzLE3t6E6T+7CANIDVOP3RTPKz+wUMY/WJbm93kEjoOQjfqOkI5aZIByNISKdCoVp6ig7p5VA==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr24119814wrt.279.1607876727343; 
 Sun, 13 Dec 2020 08:25:27 -0800 (PST)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id z2sm27245655wml.23.2020.12.13.08.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 08:25:26 -0800 (PST)
Date: Sun, 13 Dec 2020 16:25:25 +0000
From: Jamie Iles <jamie@jamieiles.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/4] Remove PicoXcell
Message-ID: <20201213162525.GA223635@willow>
References: <20201210200315.2965567-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210200315.2965567-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_112531_375204_B10E0655 
X-CRM114-Status: GOOD (  16.53  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, soc@kernel.org, linux-crypto@vger.kernel.org,
 Jamie Iles <jamie@jamieiles.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201213162525.R4zi46M75LuoZbstI9UipmF7IZnireSj-KkWUAgDEPo@z>

Acked-by: Jamie Iles <jamie@jamieiles.com>

for the series.  Intel EOLd this product now, good idea to remove it.

Thanks,

Jamie

On Thu, Dec 10, 2020 at 02:03:11PM -0600, Rob Herring wrote:
> PicoXcell has had nothing but treewide cleanups for at least the last 8
> years and no signs of activity. The most recent activity is a yocto vendor
> kernel based on v3.0 in 2015.
> 
> These patches can go via the respective maintainers' trees.
> 
> Rob
> 
> Rob Herring (4):
>   ARM: dts: Remove PicoXcell platforms
>   ARM: Remove PicoXcell platform support
>   crypto: Remove PicoXcell driver
>   dt-bindings: Remove PicoXcell bindings
> 
>  .../devicetree/bindings/arm/picoxcell.txt     |   24 -
>  .../bindings/crypto/picochip-spacc.txt        |   21 -
>  .../devicetree/bindings/net/macb.txt          |    2 -
>  .../bindings/timer/snps,dw-apb-timer.yaml     |    7 -
>  MAINTAINERS                                   |    9 -
>  arch/arm/Kconfig                              |    2 -
>  arch/arm/Kconfig.debug                        |   13 +-
>  arch/arm/Makefile                             |    1 -
>  arch/arm/boot/dts/Makefile                    |    3 -
>  arch/arm/boot/dts/picoxcell-pc3x2.dtsi        |  239 ---
>  arch/arm/boot/dts/picoxcell-pc3x3.dtsi        |  355 ----
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts  |   78 -
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts  |   84 -
>  arch/arm/mach-picoxcell/Kconfig               |    9 -
>  arch/arm/mach-picoxcell/Makefile              |    2 -
>  arch/arm/mach-picoxcell/common.c              |   81 -
>  drivers/crypto/Kconfig                        |   18 -
>  drivers/crypto/Makefile                       |    1 -
>  drivers/crypto/picoxcell_crypto.c             | 1806 -----------------
>  drivers/crypto/picoxcell_crypto_regs.h        |  115 --
>  20 files changed, 1 insertion(+), 2869 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/picoxcell.txt
>  delete mode 100644 Documentation/devicetree/bindings/crypto/picochip-spacc.txt
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x2.dtsi
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x3.dtsi
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
>  delete mode 100644 arch/arm/mach-picoxcell/Kconfig
>  delete mode 100644 arch/arm/mach-picoxcell/Makefile
>  delete mode 100644 arch/arm/mach-picoxcell/common.c
>  delete mode 100644 drivers/crypto/picoxcell_crypto.c
>  delete mode 100644 drivers/crypto/picoxcell_crypto_regs.h
> 
> --
> 2.25.1

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
