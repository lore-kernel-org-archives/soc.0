Return-Path: <SRS0=YCAW=FM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1F1C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 10:32:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5790123AC6
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 10:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5790123AC6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Etb+mg4NG/xnfRk1KR9Ykj2a4xQO/ywAJBTxBq+lVmc=; b=l5rc1SNWP5OFlGtj2tkeHmRqh
	esW3kHCPKjIO4/DnrilBqOTxAIgcRk7FcSAMPuU/lsr5o4XqnJxUWiTUFHaCADKsaNXScKm6/SN3s
	6a1h8DnW6Ao8PuNfRBpavP2SJ0vsjFu1dC6u+vP2rG7wefgSnxJ8qanirXvMTeSAJ/iC9p4+Cde1e
	Z0cn1sSwsDBuXeXM7regYXvHMIT3/52uNEtXsAJx2KpvdjJSWKIkDbnfwJLmNTk/Jmxbjdqdc++1z
	bqA9hUH2aoUkS99CtSZ76ZEHSr1HglfJMXpA6KBN8Hif+YhbveCqbF+VDbhOCD5FggIlc9gS7B/M6
	UzHhTnmpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmaHv-0002uF-Lw; Tue, 08 Dec 2020 10:32:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmaHs-0002tk-Rq
 for linux-amlogic@lists.infradead.org; Tue, 08 Dec 2020 10:32:06 +0000
Received: by mail-wr1-x441.google.com with SMTP id i9so111970wrc.4
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Dec 2020 02:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=OsOFwwTibWIIgXdSS661vhPH7QqBIoPplM/Uv2VVAhE=;
 b=cllvy0Im44SWAjjkvckWVWMM0igPGtWkKOBzZBRQOzxPrcHCiFXDid/6JbQqnj4329
 7gsGOH7/d88WfyarBwtro7Hy5j0+usy2j4oU0Yat/gdHWnK+mFyj6iFEmYYLMYdD3gMk
 RH8Y3mWUOsZJBXLa6klzyCtMnwRabkZuMbTzkmMei/hWGR3m76joRVqyOSNH8W1EoDoR
 IvoNmD/yft8DbxUDVAS1uiFD2vKlTmfx/plw3lfjUJDPV6+LCI+QhegYlEXcEU/TL0Wz
 BE/ktTZZlOPH5E5FMLC1qFBhNe/b/XEjzifN99aR8NxXJPkrG35vr7eLZNf47Qhyb+Ft
 hEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=OsOFwwTibWIIgXdSS661vhPH7QqBIoPplM/Uv2VVAhE=;
 b=GvpKOwOeYmX5uUlQn68XmbYyB2bIYCpxrlw45/+V/TvJ215moorOOh62SEakCy4Y8p
 wZBLejpiCKpv/gzIgEGynrQVbE4oDQEL8YSiIiz6PwEz3XdvD/PYs2tL4Vi1GdASL5yf
 XUOxhYZUGix7w3tITuYXoqWV9sc7msDOHalqPW8tOyfI7fvSSRnS7DuJi6RTpg40GBNe
 PRLyyL6Zy3i/exPAP1DLcqBgsgrzXtEX0SJbUuZhB47U+lN+wBXjWOXYfqMVMVvbkVw4
 uVue4oARsZW0nnHxfvdScZiAaAZSt05rKBqWoUmhbtUKxfA+mKsXVRkL5zT3nTiuMead
 rbtQ==
X-Gm-Message-State: AOAM533lLbCbP7zLE2Dh9q0Xuu/FGAcvmi5hjEs3E914YY60gFkzaxNF
 dSxUDGW8Nk+6i8Sd1w7rKm+1d/hwlT9wZWye
X-Google-Smtp-Source: ABdhPJyxCO0oK+cn308uCVHa8yccW9YgLUb2zDP43HloeDehM6Vcn8G8jB7bTcWsSFU6q7rnh/Di7w==
X-Received: by 2002:a5d:6250:: with SMTP id m16mr24785605wrv.400.1607423521910; 
 Tue, 08 Dec 2020 02:32:01 -0800 (PST)
Received: from localhost (sparrow.liltaz.com. [163.172.42.206])
 by smtp.gmail.com with ESMTPSA id f9sm10210288wrw.81.2020.12.08.02.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 02:32:01 -0800 (PST)
References: <20201207230156.10198-1-khilman@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, soc@kernel.org
Subject: Re: [PATCH] arm64: Kconfig: meson: drop pinctrl
In-reply-to: <20201207230156.10198-1-khilman@baylibre.com>
Message-ID: <1jo8j4k2qn.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 08 Dec 2020 11:32:00 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_053205_078871_6FDFD27F 
X-CRM114-Status: GOOD (  12.83  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208103200.4UcX3kWyUW94FiL51q-BzsNFOeONJcLifBZLUiU9cm8@z>


On Tue 08 Dec 2020 at 00:01, Kevin Hilman <khilman@baylibre.com> wrote:

> Don't automatically select pinctrl drivers, leave it up to defaults in
> drivers/pinctrl/meson, which default to built-in, but are also now
> optionally configurable as modules as of
> commit 9c65441ec823 ("pinctrl/meson: enable building as modules")
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> Arnd, Olof: I missed this in my earlier PR for arm-soc core changes.
> Please apply directly.
>
>  arch/arm64/Kconfig.platforms | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index e4e74e0b5b01..6c4d7356d918 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -152,8 +152,6 @@ config ARCH_MEDIATEK
>  
>  config ARCH_MESON
>  	bool "Amlogic Platforms"
> -	select PINCTRL
> -	select PINCTRL_MESON
>  	select MESON_IRQ_GPIO
>  	help
>  	  This enables support for the arm64 based Amlogic SoCs


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
