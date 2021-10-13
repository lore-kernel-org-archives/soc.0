Return-Path: <SRS0=WY91=PB=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA96C433F5
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 23:43:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A69ED61164; Wed, 13 Oct 2021 23:43:26 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C72610CE
	for <soc@kernel.org>; Wed, 13 Oct 2021 23:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82C72610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id g10so17009598edj.1
        for <soc@kernel.org>; Wed, 13 Oct 2021 16:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=70WgJz68301W4YAWeUnEt0QpDAyQBF+Qn8eRADlWcZg=;
        b=tZA9wgJTf8LhUZogPP5QfxAXUuLBr2snIF0TIThAd0bHlqMQg/8FW01FUEIuqdBi5P
         sqOZmZsU9vrBPGuqMaXAwnnljLuKj+cCGBSN5KqI+oDmc7+7Mc4ivT+v2zMVGgbnqY6R
         6x+HYqb8EoKh7wvACzBGViDQp2DNhIu/rhZnE+uIsNc/ysxbBZsoRoBAVuVEq7tg/Dcu
         aUtNBspxTrzkAV8rhuJaKqGKRPdfAY18gY2iZvVF3SGv63AMGLwsW6VrGTrsMb0u0MWT
         O/O4fkqgv4o4JsR0n/2hco/6stuJ4d1sWpMRRAH0k/Ela+yIYHNedsfxDn+eMaud4bhM
         /4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=70WgJz68301W4YAWeUnEt0QpDAyQBF+Qn8eRADlWcZg=;
        b=n11qxd3tpeHrf7TF+3f5xdX2bmIOlBneSJdV/xpIZkN8h0hvtIUvmRCTWHfkhs/PyO
         Fy9uqEaXBdrW51SWabuuWadb2cNMSzO7DvNVxaKAyVS9JIJlnyJ3ebhe7Msk6FvCqqDQ
         6Dxuu04QxeSYxVzM5CxVntR1EPbVSbe++oSRYVkLlXLxvdnt6QIJizPhoLKunfFz2wYw
         b6EEbMMSQ2gahU5l4cnprnUSTfNjxnpbvR0hidf0ii2jqJsT4P56XDOs9Eq1WK9DT+gg
         uHtaAYloDpsG3calY2UIXGehCQGfc2n726X1k7eGP12lnJWagpw9lQZinafLK/jMoMK+
         2K5Q==
X-Gm-Message-State: AOAM532Pixn9Um3jkXpUtvPXu7jLe+neb+WZAqSNtWFt5Vdb6QL+VOYt
	h4eVu2jJX5fpdhkSVpbBq+DN7PBaqYwv+lp26s64IQ==
X-Google-Smtp-Source: ABdhPJxUMstUt73PfXbllHC9NHBVobh37BXe7qV1Bk73wDAlJ9lF1d+353wJ5XQjmhvwV9GfreivHf/BEnZFxTyfbZg=
X-Received: by 2002:a05:6402:34f:: with SMTP id r15mr3664494edw.111.1634168605027;
 Wed, 13 Oct 2021 16:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org>
In-Reply-To: <20211013143810.2101838-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Oct 2021 01:43:14 +0200
Message-ID: <CACRpkdbbZo1VUk1yBWuuEswiThf5Vrbgq0SFo07Z_FMy4vvibw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Liviu Dudau <liviu.dudau@arm.com>, 
	SoC Team <soc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rui Miguel Silva <rui.silva@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 13, 2021 at 4:38 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> dtc now warns for the LED nodes on the versatile-ab board:
>
> versatile-ab.dts:126.12-132.5: Warning (unit_address_format): /core-module@10000000/led@08.7: unit name should not have leading 0s
> versatile-ab-ib2.dts:17.12-24.5: Warning (unit_address_format): /syscon@27000000/led@00.4: unit name should not have leading 0s
>
> Remove the extra zeroes.
>
> Fixes: 07ebfa59b9db ("ARM: versatile: add the syscon LEDs to the DT")
> Fixes: 7fbe5f7ff267 ("ARM: dts: Add Versatile IB2 device tree")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Fair enough,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can you apply/send this directly to the SoC tree?
I don't have any other changes for Versatile this merge
window.

Yours,
Linus Walleij
