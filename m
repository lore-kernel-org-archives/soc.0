Return-Path: <SRS0=Eam1=MP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8174DC4320E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jul 2021 10:36:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52FBA60F35
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jul 2021 10:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52FBA60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D21hywEHz4+/firSGgj1T2un+EsJey5aIIUfsIeD77U=; b=mR5BPDTD3zmU4Y
	hkToTWWuRtQ8mGZilzlHHv849W5u1fN68Z77qNrFgmTSbRJA1ojMLoYHFW+bRXihUHPkKPNnGrlT/
	oGz8Jmy9b3CzDEWuaJw8vJrxOI3VHWMDhl8xxpJi+3Zz5gL2YE4qrMkvyZL9Mwku3wqbdmfTIePho
	EY5Jnk+b5XYiV3a2AZDty+J18GIrz9ZaVdcatK5mG3yYY3OHbX1tDc54u6nY6YYylnPubNc9UqTZt
	kVRJxTdiGv5b7d15tDMmkF7P1G0txdyr3jCAuv1ClgmTUBci3Ohi5018fz4xBtA7KTGEMqVe0blCf
	rW/GHWCYgr/Pk4zQFKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6sVv-004ORD-BC; Fri, 23 Jul 2021 10:34:43 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6sVr-004OQl-M3
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Jul 2021 10:34:40 +0000
Received: by mail-lj1-x232.google.com with SMTP id h9so1112707ljq.8
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Jul 2021 03:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=swGcTNpA98MU/vBFxvZLl9qo7SscXLpjeJm2hi9sy7I=;
 b=fcmHRd/Vsw/hxY/nlM1A5Q8ziml1XikfWihkC5N1/rqK3UXsBVjF13+j+c7VGdeAQ9
 qnmcozaQc22tvuwglbyJJyZ9TTUBlx7eXU0lZmBTQYHWSoYfjP5BHpCFitc9zQRmC55p
 isNdKSUBA0ESGnN85ENYb9mTxeUj3P7D50Sl+4LOCBbVILanTs00UnboMm2JMpfBvu0D
 Ur5a8DtDJY8z3ZE45eZpY1i0KLptXbB9fhGORaXLXQPN16ZJQopTILB9fE0x4SshyobT
 xCp+aBrBT0mxNeq3C+aEed/s5DS6ouCdToZrKj9H9YNiUNjQC726eWclZRuco3DkqYgh
 KYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=swGcTNpA98MU/vBFxvZLl9qo7SscXLpjeJm2hi9sy7I=;
 b=AXamPCC0tNvQYyVcy/6klU+7+E7NsqfkzcygD+NMQNYEfhpqVb6nDZHFJ2gI0O3by9
 rwv0yToh4sN6w2QdgxdlO0PYdTuu75p7sl9TlcYEEjM9lCZ9EKDf/JD9+3cOuJBJtgmQ
 1A50ipHowiyZjTkxSEz1ktWCsSbRotbZrPx/RtwCfAyCPgwMQMwW7QWtkj9pTWrv8H5q
 p1C8FY/C1FQCFMnJvdnvlod4RQ+sVRaXCWfENMKHyonE1g7vZueAPvd3hdTjBtAbeZck
 nAIUfzP3tlEgXpo69/ZL3v+YdNU3hPgN8vee2/qXkSQei7ew2kISvIZDvZB6m6HkS1Co
 Nq4Q==
X-Gm-Message-State: AOAM530/VOgXUuHdDkOy3Z+KQadGpwgkwY7xg77Xj807H8p+ZDGlP+h+
 b8ktWRICrMTP8t7El5C+ClaNLWa+idilugCtPi9mcA==
X-Google-Smtp-Source: ABdhPJzCFJwi0QtxItn9n9d22Y44wmE7wx/d8aLLz8VyvFA97du4CxRRxIrfYiQRUruKvqLhoVIWcU1xYaulvbb2KbI=
X-Received: by 2002:a05:651c:169a:: with SMTP id
 bd26mr2912069ljb.368.1627036478284; 
 Fri, 23 Jul 2021 03:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210618205533.1527384-1-clabbe@baylibre.com>
In-Reply-To: <20210618205533.1527384-1-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 12:34:27 +0200
Message-ID: <CACRpkdZNeJLsOhAOqD9TPsPuHDjK4ec-SUAVrLXvVOkcGd1S-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: gemini: add two more board
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, 
 SoC Team <soc@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_033439_769024_64140C23 
X-CRM114-Status: GOOD (  12.26  )
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
Message-ID: <20210723103427.8Xj34fCDp6mGbI356KTlhsaMypbzSDxIpiHXenIZkhI@z>

On Fri, Jun 18, 2021 at 10:55 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> I have two boards with a SL3516 SoC. Both are NAS box.
>
> Changes since v1:
> - ssi1328 use now redboot-fis partitions
> - added pinctrl as asked by Linus Walleij
>
> Corentin Labbe (5):
>   ARM: dts: gemini: add labels for USB, IDE, flash and ethernet
>   dt-bindings: add vendor prefix for edimax
>   dt-bindings: add vendor prefix for ssi
>   ARM: gemini: add device tree for edimax NS2502
>   ARM: gemini: add device tree for ssi1328

Thanks Corentin!

All patches applied for v5.15, I saw that the NS2502 does
not make use of the redboot FIS partition table but that's
no big deal, you can send a separate patch to fix that
when you can test it.

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
