Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7D0C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 20:22:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5677C64DD5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 20:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5677C64DD5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c9AwdIa6PLxdWJFRh9+YEf0uTypb8Qr3+EuwV2kQH7w=; b=LElJIvShWAofk9jvFxbFT1XZ0
	8HuKbljwYt0kQQ4474OR3CrT4UU4MSb2FLLX5tMqNPORXUR3RNxIaVY1lQeJz6zcfZQofxDNwF7cm
	sZHaI3rDmvyUs9JdYqqVco89FdEQMfhyqrpSj8NUBZFnKofq+2WEFZo719KpLsfThH3CnCQuJ351r
	kmMdDuhsM89LuCoVPXRLnZzynHmWgaRk7OcFNAl5Gx4GjZjwbVO5jFu/EhZsurriAFDn+XCiUXl/H
	tJsDEStuYgNfWaq0Rg0u0WDx5qaAmiMcatoaAIVj8tl7kHocV9qrLFU6AmoxYNIbkwUtsR7oNps4J
	V9mw2BCng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9D2T-0003TA-N6; Mon, 08 Feb 2021 20:21:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9D2S-0003So-3D
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 20:21:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 502CA64D99;
 Mon,  8 Feb 2021 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612815699;
 bh=wHZAc6RD+HIapiTCbWnMcMywc4VHz+Gf/zCW2JwA9Mw=;
 h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
 b=j9lniCF7i4kI4J5dnmYjuHq8QZHM9GIy5LLGakaxXgHuaVnBsuLNgEFXN7WCThjdH
 IYRdea5lnUM9dIm5oipAYG3s21LAWaoZ6MnCdaR8ry87XuG/vpslJusjBB7TggKEjb
 AdVPj/w6dGcwmPTYmxR3yi+1S9YaSb99QBoak0zLR1oNIrOrSnLMu59zJFuw6TcWeA
 hDI0BIQrcfRBzUg0e4Mdi0gfoe00MbkQoz40f8c8TcFkFrhe5Mmhi7WFvkMcc2+J9G
 5KaFd9MW1D8ATI+D6KkP7ckySD3sG6+Njs0lFaT7G+x2iXnw/vNsFn1B31Ba/yNX2o
 xLqMbJLp4xtuw==
MIME-Version: 1.0
In-Reply-To: <20210114151630.128830-3-u.kleine-koenig@pengutronix.de>
References: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
 <20210114151630.128830-3-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v1 2/7] clk: Drop unused efm32gg driver
From: Stephen Boyd <sboyd@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>,
 Olof Johansson <olof@lixom.net>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 08 Feb 2021 12:21:37 -0800
Message-ID: <161281569793.76967.2912654712529822778@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_152140_219710_E66AB0AD 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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
Cc: soc@kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208202137.QbrMOXyZLaWHR9iKhFxnN9mGYyLPrAJiVypvQB29tp0@z>

UXVvdGluZyBVd2UgS2xlaW5lLUvDtm5pZyAoMjAyMS0wMS0xNCAwNzoxNjoyNSkKPiBTdXBwb3J0
IGZvciB0aGlzIG1hY2hpbmUgd2FzIGp1c3QgcmVtb3ZlZCwgc28gZHJvcCB0aGUgbm93IHVudXNl
ZCBjbGsKPiBkcml2ZXIsIHRvby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQoKQXBwbGllZCB0byBjbGst
bmV4dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbAo=
