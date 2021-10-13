Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F032FC433EF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Oct 2021 23:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D255461181
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Oct 2021 23:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhJMXpb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 Oct 2021 19:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhJMXpa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Oct 2021 19:45:30 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849B9C061570
        for <devicetree@vger.kernel.org>; Wed, 13 Oct 2021 16:43:26 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y30so446958edi.0
        for <devicetree@vger.kernel.org>; Wed, 13 Oct 2021 16:43:26 -0700 (PDT)
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
        b=QSim/eif3JYoUEO2BVtUzYkAp0x0xFz61uf4DXqH16dgXWlaceSYLUNL4WY2RbOfy6
         zy0JJ3Qz1OokJz4Pxxslsh/rCBk0fwmUh/00JLYsy7uyrrNMePQ7WvT7QmScr6wL5eag
         4VSLPJ4Ocz/3173lRpRsw/hyNsGnZI61boIgnE97JJ5Iq0hXMnuImRdtz+mYSuJTqSJf
         kxaJ6zqV2bHqo6eqA21q6aVJ6qr5lZXHarjViyzNZ4EAkqUswQc0PQlBFnOedtL4G5M+
         9DTqpjE03C6uGNQjbD+qy41mFHp/WcIBPKbD+8JmtcaQhkJ2+dGkARG9tpflVrVwcaMd
         U2tQ==
X-Gm-Message-State: AOAM530JwFmtNk3uatcBjzNC9RUEhmGqXQz8GQtkFN/mLbawOR33tacJ
        cPNertfoAYW8ThqRRcHhj5jf9MEd2VPil43KJfy7FVyzcGw=
X-Google-Smtp-Source: ABdhPJxUMstUt73PfXbllHC9NHBVobh37BXe7qV1Bk73wDAlJ9lF1d+353wJ5XQjmhvwV9GfreivHf/BEnZFxTyfbZg=
X-Received: by 2002:a05:6402:34f:: with SMTP id r15mr3664494edw.111.1634168605027;
 Wed, 13 Oct 2021 16:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org>
In-Reply-To: <20211013143810.2101838-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:43:14 +0200
Message-ID: <CACRpkdbbZo1VUk1yBWuuEswiThf5Vrbgq0SFo07Z_FMy4vvibw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To:     Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Liviu Dudau <liviu.dudau@arm.com>, SoC Team <soc@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20211013234314.a3j0Lx-Tbjlr0HaO24XSjoPMP7XgJIryhvwLsR0ikK8@z>

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
