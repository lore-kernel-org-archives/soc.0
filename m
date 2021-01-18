Return-Path: <SRS0=lYfA=GV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866D7C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Jan 2021 15:22:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45E8C223E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Jan 2021 15:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45E8C223E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xRquHX9W7ja0+2bNQm0H/JhdLs3Hv7j4hkt3iK4DLw8=; b=Xg/WdDvMiSQ/jjigCNR+jwExb
	MTP09ieREw8yEIHxsETPKXwP1NhoH9Lenpme+leDBMuQfmhmV2Z4MTx98urD3hTZHrpcvYgUQ4/dF
	sLragQFm0e7Idkcq/SVBu4P3ALqD3AOucoYG3S2bBPBRe4yhcGtSVdDggKxQTfIlReRElPy6IJF0u
	rOVSwoHpN4shzGJ7b8Bonm1LzGexzH7v2HSs2V/IhP0xDwM7Ey2vFJpy6FxhDARoFVY+DaX/7xr3x
	lIagSgZBdP1lRqFa7WXBXIzaK+tUDA6XJP8DYW2hauQysVrOIAUGqZfL8/1pyVgIfThjcU9NK6WUK
	cif+0ZSOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1WLF-0003n9-PN; Mon, 18 Jan 2021 15:21:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1WLD-0003m5-Ol
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Jan 2021 15:21:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74CBD22573
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 18 Jan 2021 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610983274;
 bh=ER2r2giR28b5esnhi88+x3d/UsSbWXp2fQ0xfzYXHLo=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=m04F5pNRyZm4uPl0gPJTZ74dp9ZBkfOE7I+lq++oLWqkp7Zcf8EQ3VXPGLsvmNj49
 RQwHJDxEV9JQ3HZcqThk/o+IO4My4MP1Byj2Ra9V5vkc8fHdQ/m5wZFpg/eSJlPTZr
 m0CyGJ/ZSm/9wbAoL+FzfanUhi/6PZnCaWO0WUPBJdYXvdsJJk3EzyaRkD7bAiVQcY
 bNE9WrfDzRpPwYKKYPCLF07Q74QJ107k/kS5Df85hHE3llKuttUI7Yvb+Sc8dOLIxH
 8c54Tw0W/YE+Or+Z/eWUxVO0uFiAZmhoOpktv70w/X39h+H+9ZlNeTKbJiXIMkWvG+
 OyZumTKZ+QuGg==
Received: by mail-ot1-f53.google.com with SMTP id 34so5723436otd.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 18 Jan 2021 07:21:14 -0800 (PST)
X-Gm-Message-State: AOAM532+G6e5J0uCH/3/o/CHRjvOQgBT3sUy70MXe/29s95g3O9gvsVx
 ZTF2ztTP9z4m7HONXNE+ojQNU6BmzzcLndnGDdk=
X-Google-Smtp-Source: ABdhPJxo+FbwPtcR/KM/ExQ4Vi/39GUf17/M51OAsCOJB/yW2MFk0+n7jwLwa8Oo5f1UtqxDAjf3hSswWCPCe4y1oC0=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr3921otk.210.1610983273879;
 Mon, 18 Jan 2021 07:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
 <20210115155130.185010-4-u.kleine-koenig@pengutronix.de>
 <8293fc1b-20fb-58e9-d610-86eefd218ee9@linaro.org>
In-Reply-To: <8293fc1b-20fb-58e9-d610-86eefd218ee9@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 18 Jan 2021 16:20:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0xP98ya0KZfq_6nOj+Ahn0+zmnFWqDQOHxKc3sq7u-CA@mail.gmail.com>
Message-ID: <CAK8P3a0xP98ya0KZfq_6nOj+Ahn0+zmnFWqDQOHxKc3sq7u-CA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clocksource: Drop unused efm32 timer code
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_102116_077816_B7285B88 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210118152058._fCmudaQ3pQtNvQ8-ud5f-ArNI0606ZE2pk_Xt3Ya1E@z>

T24gTW9uLCBKYW4gMTgsIDIwMjEgYXQgNDoxOCBQTSBEYW5pZWwgTGV6Y2Fubwo8ZGFuaWVsLmxl
emNhbm9AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNS8wMS8yMDIxIDE2OjUxLCBVd2UgS2xl
aW5lLUvDtm5pZyB3cm90ZToKPiA+IFN1cHBvcnQgZm9yIHRoaXMgbWFjaGluZSB3YXMganVzdCBy
ZW1vdmVkLCBzbyBkcm9wIHRoZSBub3cgdW51c2VkIHRpbWVyCj4gPiBjb2RlLCB0b28uCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5n
dXRyb25peC5kZT4KPgo+IFNoYWxsIEkgdGFrZSBpdCB0aHJvdWdoIG15IHRyZWUgPwoKWWVzLCBw
bGVhc2UgZG8uIEkgaGF2ZSBhIGNvdXBsZSBtb3JlIGNvbWluZyBmb3IgdGhlIG90aGVyIHJlbW92
ZWQgcGxhdGZvcm1zLgoKICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
