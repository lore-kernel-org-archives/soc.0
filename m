Return-Path: <SRS0=piaZ=KH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_INVALID,DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72F8C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 May 2021 20:09:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62B6F61420
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 May 2021 20:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62B6F61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B5DcU5EUnso90uHhi4JC2VqF5OiqVfjo5M3WWTnFIY8=; b=ATyyUUy84pKAxk0neJ/gZIKk2
	jzmnHxTrPmlTn50Zf1z2iNq4vwmn/apF2K6i2DqHN3BaGj0SqRVcGTKtz2bCu1mipVUgfXievy2xt
	/8vyYQif2vPJj5FGP5eJgmP3VoWLjvq57R+Ms/VO59GoUqraY9kg5Ah1oR51ZT+QBulRiDRMdnqKY
	w1W3QJE9asheshvY45tpd5ZHxDmF8NF+WhokHSANgFynyg9AryF5siNvc+6CrMXxG1nANJGUf59nk
	FvP8zE+6wKwi1xGWtdDCq+y0qk3pUmKpFo9tFSXf4lUzfmPBLurJ2OfNth3SfhpClOXS6JShW3qjD
	qbeqBgSrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgv7t-003qrc-FZ; Wed, 12 May 2021 20:06:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgv7T-003qoP-Fn
 for linux-arm-kernel@desiato.infradead.org; Wed, 12 May 2021 20:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jJ6/WIxX35/cgvS4ItB41jw5rTb0BK4tQYBXu93W67Y=; b=r11x1JRi7Dw0dhw6HM7xQeFP4H
 pI6Za/465FAPX86JMormHmaYOW7Zte7RAgzUXOI2lOMfepTiE3CTCP9oohS8bUfm7NaUdcbXFjYNC
 FbCHo4LzsJoA16UodrHsZNS8DBCNgYiJ044XGttOHUDyYTfh6iiqse4SaqMe7DCZ0zoSAwo28778t
 8lFcKPQFMafrQMRSI6o7i9B5wdE/k6RSJ77JZKvRZfz6tvJ1Jk8HApgrE8t5MKWLdgMQu8k9Tjy0P
 bhSv0MN2NVbcS8xIUBfS/KqJKzm8C82EeQn/c3RA4HpaBFk2tzgLsBsY8gp0f9izoKHOzGgEQn/xy
 rYsMi7sQ==;
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgv7Q-00Amj9-W3
 for linux-arm-kernel@lists.infradead.org; Wed, 12 May 2021 20:06:10 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so21670230otp.11
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 12 May 2021 13:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jJ6/WIxX35/cgvS4ItB41jw5rTb0BK4tQYBXu93W67Y=;
 b=jrhoGbv5kj/19E7wEUHBbXIDgDLTKvSjj339bIyAN3gYl6z7wvsAC0PgrCLblPXBnL
 dcpM61mKE6uf1QXVgPRGOVvLVk0sRyWU6twdXYUid0ywAd8Z/F9VvcZNmIRToH7wmOMq
 uzBjm3cHBO7fsJrOkFr1p+TuDByn0MoXNmCc7PUkz5prlzr6gGJzjkA0bIu3Tg+xtv0Y
 uvuj5HE31Dh/BmoELHesJenJfYoYVeqrbrNy6IH1JDZPpM/aeGlmHfLGADeduUiqxS0f
 wF+aC9QUl7R6VKkPWbAv5ThsVfifZhKST0UWBhesrudDF8Ba9fZJ1yYcl0prOgReIaD2
 /t8Q==
X-Gm-Message-State: AOAM530HX7z/DOgxmI95PXuZpJCsoiOrESELgn23pCuFjZqZ9zJa9RPC
 DGKfdxkmpmWY22Kgo7hxIQ==
X-Google-Smtp-Source: ABdhPJzKpxijVnBg01nSUqX6XBNqlBFU569+S2ZMwpc/HM4IjbTww8FstbHf9rltb5ioWwGcfA7oIQ==
X-Received: by 2002:a9d:7189:: with SMTP id o9mr622813otj.180.1620849966762;
 Wed, 12 May 2021 13:06:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l11sm214762ooq.44.2021.05.12.13.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 13:06:05 -0700 (PDT)
Received: (nullmailer pid 2451241 invoked by uid 1000);
 Tue, 11 May 2021 19:16:53 -0000
Date: Tue, 11 May 2021 14:16:53 -0500
From: Rob Herring <robh@kernel.org>
To: Eugen.Hristev@microchip.com
Subject: Re: [PATCH v2 2/4] ARM: dts: at91: add sama7g5 SoC DT and sama7g5-ek
Message-ID: <20210511191653.GA2446068@robh.at.kernel.org>
References: <20210511071223.71379-1-eugen.hristev@microchip.com>
 <20210511071223.71379-2-eugen.hristev@microchip.com>
 <070939b0-ec77-a135-b351-4c4c8bc543f0@microchip.com>
 <YJo0PY2E36v2Pqz/@piout.net>
 <8c74596c-6d23-c822-fc2e-6cbb984fa4fd@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c74596c-6d23-c822-fc2e-6cbb984fa4fd@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_130609_065734_4BAD175B 
X-CRM114-Status: GOOD (  18.30  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com, soc@kernel.org,
 Codrin.Ciubotariu@microchip.com, Claudiu.Beznea@microchip.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210511191653.ZwXM8G_bYoq6ogn_8uGBozaicCSr1CvVcEvclEvQorE@z>

On Tue, May 11, 2021 at 09:03:37AM +0000, Eugen.Hristev@microchip.com wrote:
> On 5/11/21 10:37 AM, Alexandre Belloni wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 11/05/2021 07:18:31+0000, Eugen.Hristev@microchip.com wrote:
> >> On 5/11/21 10:12 AM, Eugen Hristev wrote:
> >>> Add Device Tree for sama7g5 SoC and associated board sama7g5-ek
> >>>
> >>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >>> [claudiu.beznea@microchip.com: add clocks, ethernet, timers, power]
> >>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> >>> [codrin.ciubotariu@microchip.com: add audio]
> >>> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> >>> ---
> >>
> >> Changes in v2:
> >> - fixed license
> >> - fixed warnings for make dtbs (changed ahb/apb to just soc)
> >> - changed some node names as suggested
> >> - removed some okay status properties
> >> - addressed cpu node by label
> >> - removed stdout path
> > 
> > Why would you remove stdout-path? The solution was to remove The console
> > parameter from bootargs, especially since you don't know what name the
> > console device will have depending on CONFIG_SERIAL_ATMEL_TTYAT.
> 
> Ok, sure, I will add it back and remove console=...
> 
> I will wait to see if Rob has anymore comments before preparing a v3.

No, nothing else.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
