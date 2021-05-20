Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B755EC433B4
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 May 2021 13:08:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 919CD611BD
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 May 2021 13:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242994AbhETNJl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 May 2021 09:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243599AbhETNJW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 May 2021 09:09:22 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17044C061359
        for <devicetree@vger.kernel.org>; Thu, 20 May 2021 06:03:00 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j14so15852898wrq.5
        for <devicetree@vger.kernel.org>; Thu, 20 May 2021 06:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RujbwDaYHFW5IRTsBmUkuqcLlODQklcnrNzBpulfars=;
        b=Hez+1QvK3f6pRKDh5FTV2p7JSR2zoExN4Cl3/Dx2cllg9rc5e79U3aAIccTzfU8ZRu
         2c+QRasDl48g2C4Q2+oMxxYXmZOZ+RiBi0DqdUrpHYIXR3ZNaAszYihACj3KRGupUaAk
         /YgdpPOB8KeLk/rd9SqzBZtTgtVGXz7sI/k8Ucwoh0at5mSCzTp1gwYLYDj4vXkVzSp1
         rZoDsrHEB97HWq7fFGd/JZN1L3Vidu9aKKWsutkCux7LfQbcNw5UwUqo6G6yXwVvffMW
         zqzhkTFwuEvlsGPTPO5LJCAvl/qle/ZcsnPyuYYOY6UaGi+C7Hi9zdZMDRih2surH53f
         ypjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RujbwDaYHFW5IRTsBmUkuqcLlODQklcnrNzBpulfars=;
        b=DtoQoZ3MeVuxtIKZf1iU67oFz8aopyHpYdRYM5gGNJwyrEhkb26CGi5yn8pBGTE8K+
         cViyUcB3pdq3DgjKNYQXPHtlBGhlMVSlMLx422QvdYl01+SUa8sR2au+fnVLMGSNgQ9a
         AQNeUGWGqKDx1wY3bEQaYvr61tfsIwyI4f/DAeuKd8F/SYzhQ/CJoO91LgDzRDv0GnnS
         VKh1SbwtTfv07Jve9TuMGexirXmw89q6dHoxr9jlz9q4cY5S4TRkfFjJw0cfyE9C3dU0
         3LW/mCUvaVNMfyUooYNJHsejZD3/lFfYpYyW8rrxsX2iHIIlqntFC3tH2KN5pz6yW4+F
         /j6A==
X-Gm-Message-State: AOAM530R9xuWup9jmJpH0Q0xvmXi8fZDo26QUtnep89ltqZ+m1aZzlQx
        0A0W1Zjm9vqG5HT/eLarkwAeTw==
X-Google-Smtp-Source: ABdhPJzX3bmOQ9LWAQDKQedPbmuDcmKqA23EagI44Yp+34fGVp8IMK0lCgDStoMI83fJxNiQ6DdA1A==
X-Received: by 2002:adf:f10c:: with SMTP id r12mr4281511wro.26.1621515778718;
        Thu, 20 May 2021 06:02:58 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id o21sm2949976wrf.91.2021.05.20.06.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 06:02:57 -0700 (PDT)
Date:   Thu, 20 May 2021 15:02:55 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] ARM: gemini: add device tree for edimax NS2502
Message-ID: <YKZd/+zHlKwag2bs@Red>
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-5-clabbe@baylibre.com>
 <CACRpkdY3c4uvo1zbEgNW0meF-4P8be_nmoOEQAHP5V+GXgoG=A@mail.gmail.com>
 <YKOO8UxdmZBjYbt4@Red>
 <CACRpkdYqaoggyBO9=fdi2iUh9O0Y_jT5jnc7+qbE9HzEWK57Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYqaoggyBO9=fdi2iUh9O0Y_jT5jnc7+qbE9HzEWK57Sg@mail.gmail.com>
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210520130255.tVCzItkJ1R_IjEoiBtrf4PQDECWNSJWqPf-UFBjc3kI@z>

Le Wed, May 19, 2021 at 01:17:59AM +0200, Linus Walleij a écrit :
> On Tue, May 18, 2021 at 11:55 AM LABBE Corentin <clabbe@baylibre.com> wrote:
> > Le Tue, May 18, 2021 at 01:46:20AM +0200, Linus Walleij a écrit :
> 
> > > Is the FIS broken since you hardcode the partitions?
> > >
> > > Doesn't this work:
> > >
> > > partitions {
> > >     compatible = "redboot-fis";
> > >     /* Eraseblock at 0x7e0000 */
> > >     fis-index-block = <0xfc>;
> > > };
> > >
> > > (Needs CONFIG_MTD_REDBOOT_PARTS)
> >
> > No it does not.
> >
> > physmap-flash 30000000.flash: no enabled pin control state
> > physmap-flash 30000000.flash: no disabled pin control state
> > physmap-flash 30000000.flash: initialized Gemini-specific physmap control
> > physmap-flash 30000000.flash: physmap platform flash device: [mem 0x30000000-0x331fffff]
> > 30000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip ID 0x002201
> > number of CFI chips: 1
> > Searching for RedBoot partition table in 30000000.flash at offset 0x1fe0000
> > No RedBoot partition table detected in 30000000.flash
> > Searching for RedBoot partition table in 30000000.flash at offset 0x1fe0000
> > No RedBoot partition table detected in 30000000.flash
> 
> Hm since it searches at 0x1fe0000 that's where it thinks the last
> eraseblock is so the erase blocks are 0x20000 (128KB).
> 
> FIS at 0x7e0000 should be erase block
> 0x7e0000/0x20000 = 0x3f
> 
> Can you test fis-index-block = <0x3f> and see what happens?
> 

With 0x7F it works.

When testing, I found that fis-index-block was ignored. I just sent a patch fixing this.

Regards
