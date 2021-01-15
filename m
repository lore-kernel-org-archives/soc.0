Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BFCC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 16:46:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B98221FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 16:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40B98221FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PwY9YaoL0eoOyEr6998+4LamVRZA/WXIu3m0ZmCu+U0=; b=nQuNzIa9iE4zt7IwMlTMP6dmQ
	db7bkSstFRZfJl2ue9Isix8Fgaj5Uz9nDx2caMOWDkr0RAwY/uvhyWQmm1FZ96Zu3lF2C3U2U00EV
	zw8PD0MGO4UPveEH4Fa/fyGkxQdx1aNAVRgH2lzXw0mzArF7wEe7KGTKaCs5KidohiWAGKZP7AKKr
	qKBJoEf7WquEmmz9eMUI1CkW0eruOikcAlSmHoxERUAlKJIOANjQktg/SskCIuvd0mBUXjKt4NMPa
	MxxTa/WdaaN4GuVjhXglYKhNaRvUy3HZf5lUJmWhWZnitZ5f7zRHq6jsdSAseFKirjNmsjp78v54O
	J/L92jvDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0SDz-0004wP-2q; Fri, 15 Jan 2021 16:45:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0SDx-0004vv-7t
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 16:45:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B25A523976
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 15 Jan 2021 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610729116;
 bh=n5nWNb65mBT/5pragNHit/Cu76jZv24j6uy/xmwMC2M=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=WfT3BidHoJh3souo9FmJhV9id547o98MWz+0wVv2RGHOd+Twbr/9GjZHd0iO0HWzN
 MCvspZk2JLCEEQUxgfMNgKqb38wraKZMmFh0DFdsWklLTz6+K9srcfcrUpHj38ISrg
 Y+LaQJqlCMnv3zQb30sPf59D6ht0cCMFECXGKptQ+H+9eKjdExeE4jSNA7p+qyz0tI
 DX6y4cSDsC85oS9gCmztKbN2U8/HvZSAPhO8haLDtDF1e4EpNS+sleZa7vCKPXiXT5
 5Be8csvGhBERRsqx5hRdP2zJIVLn27s5Ad6pwcznqZLntyHEbRji3myjYnG80DUG5w
 X0ZQ4YB7WXnng==
Received: by mail-ot1-f41.google.com with SMTP id d8so9111512otq.6
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 15 Jan 2021 08:45:16 -0800 (PST)
X-Gm-Message-State: AOAM531UMih005qfiMWlzvRKk5/2r4fGPP43G0Uq86rfaqUwswTDGRsQ
 M/9ztJik3Ddhri5ZkbiFkIhCV+76gON0EPhvT7I=
X-Google-Smtp-Source: ABdhPJwj1a8sfU7lNr6BdJzuh8m5nDjFFYrToOtW7RuAgCpvAzyVv1vParB/4ZilG+PBWJXWZamXlsfQhwrf5tYzqy4=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr8927159otm.305.1610729115945; 
 Fri, 15 Jan 2021 08:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jan 2021 17:44:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>
Message-ID: <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Remove ARM platform efm32
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_114521_363243_38051580 
X-CRM114-Status: GOOD (  18.64  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>,
 Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 linux-serial@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115164459.UskbnqGd-aaPpk3JALm0JEQ5he0P8nFPRanIXwDyV78@z>

T24gRnJpLCBKYW4gMTUsIDIwMjEgYXQgNDo1MSBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEZyb206IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1d2VAa2xlaW5lLWtvZW5pZy5vcmc+Cj4KPiBIZWxsbywKPgo+IGNvbXBhcmVkIHRvIHYx
IChNZXNzYWdlLUlkOgo+IDIwMjEwMTE0MTUxNjMwLjEyODgzMC0xLXUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZSkgSSBkaWQgdGhlIGZvbGxvd2luZyBjaGFuZ2VzOgo+Cj4gIC0gYWRkICJz
ZXJpYWwiIHRvIHRoZSBzdW1tYXJ5IGxpbmUgb2YgdGhlIHBhdGNoIHJlbW92aW5nIHRoZSBzZXJp
YWwKPiAgICBkcml2ZXIKPiAgLSBhY3R1YWxseSByZW1vdmUgdGhlIHNlcmlhbCBkcml2ZXIgaW4g
dGhlIHBhdGNoIHRoYXQgY2xhaW1zIHRvIGRvIHRoaXMKPiAgICBpbnN0ZWFkIG9mIHBhdGNoIDEu
Cj4KPiBPbiBpcmMgQXJuZCBzaWduYWxsZWQgdG8gd2FudCB0byBtZXJnZSB0aGUgZmlyc3QgcGF0
Y2guIEFzIHRoZXJlIGFyZSBubwo+IGhhcmQgaW50ZXJkZXBlbmRlbmNpZXMgYmV0d2VlbiB0aGVz
ZSwgSSB0aGluayB0aGUgYmVzdCBhcHByb2FjaCBpcyBmb3IgdGhlCj4gaW5kaXZpZHVhbCBtYWlu
dGFpbmVycyB0byBwaWNrIHVwIHRoZSBwYXRjaGVzIHRoZXkgYXJlIHJlc3BvbnNpYmxlIGZvci4K
CkkndmUgYXBwbGllZCBwYXRjaGVzIDEgKmFuZCogNyBub3csIGxlZnQgMiB0aHJvdWdoIDYuCgpT
dWJzeXN0ZW0gbWFpbnRhaW5lcnM6IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ugd2FudCB0byBw
aWNrIHRoZQpkcml2ZXIgcmVtb3ZhbCBwYXRjaGVzIGludG8geW91ciB0cmVlLCBvciBpZiB3aGlj
aCBvbmVzIEkgc2hvdWxkIGFwcGx5CmhlcmUsIHdpdGggeW91ciBBY2suCgogICAgICAgQXJuZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
