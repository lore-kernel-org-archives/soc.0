Return-Path: <SRS0=yS1I=H4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DADCC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Feb 2021 19:25:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2420564E21
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Feb 2021 19:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2420564E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uCvNkjC26eDrZfbrk7USDu1inlRN58TimUhhqChnMlI=; b=1fXKpw0teBmEzp+BsyKL8bX1v
	p/Dcp61gE4UU68xNuOg/nP3V4A0mjBMl7GvKwS9V3m8DY0QlUCOEQYO1wfcqFPpv22vuISxiP1dc0
	UEqxO0aNfyAC3rF9s4UkvmLWNLOfoYOiV/QmhiCGiX63j4ypnRgbGGpyxRIUimC3AjI9xLbE5mTB6
	OucWUo3H/yksDzG4mjVGmqO7DERUUqZtqWQLKYZS79mlJpzvxk1+h/YVADXqJM/q1ZOVtT8Lo8JmS
	kSZ9iTWRE+HpDUNv64IDSYDT9dQudmGo6NbcoqvvoVvBvfHK3phj3K60J6UIbKknHLQJxv3VkMIPl
	bKsr5ECDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFii3-0000Dn-Jt; Fri, 26 Feb 2021 19:23:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFii0-0000DG-Qr
 for linux-arm-kernel@lists.infradead.org; Fri, 26 Feb 2021 19:23:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id e10so9393787wro.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 26 Feb 2021 11:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=OsztXS2pxF0mqVb9NZgLRR6d9O9wIrx2e3naQfnixyw=;
 b=mvJeaORv08NO8JFv6YX3OR8eF2mGEPxZfE4KvPhccDkBqlM+vFrbJ8EUbyPW+S4KFL
 IKg5IoaxhhzeHbhRwG7qmM1yla9/TV2WIFUHoLqAiLUPw9Eo1/xpVgYtQ5kMGqSMYMPo
 nCdzHOFFywol73/GqgJw3G1tqgQY2i6vmjlASg+WIWtL2gWbVucVYF9DYeHH2oUDF5mt
 YGhIgGCDR9xuuQYwjVngxJH5HrHTgat5f/CcwODnA3wAd/9GrQjArsY/xpDU9soy0/Np
 TlQyg2IS+HctwnnB+Pt5gfP5E+BMoXR2TwsYCLKkp5bWoXCoTi11PrEkafAmHa7dV1Zc
 x/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=OsztXS2pxF0mqVb9NZgLRR6d9O9wIrx2e3naQfnixyw=;
 b=aBci8cMA0xhg/v6GxfXjS3vPKBeuUX656LzG20wOJCiP3PeYpj2zxeAt5q2sy3MfQf
 20ybDT6g6vPjyXlLBq3sVs9m1GKYE9M4LmcHyj69LDxkMvWGSynwdt/dh0zJ7ZQTbBDc
 3hEth6SWpzQAMs3vrr6LSpxf4e0Azi03syNDoDCEs7NOKlmhZl4El2N6zxyEtbDLOlpc
 15EvzbcW2hVFf8wTG79ieDdGSP0menTQ7ywy5JPauPTDg/v+GaCrUYuTYtKNbS12RmK1
 +NYKa5OUyQyy99vCsBM91ow379m83+UkoW9X9WclSM6rwKDyuUZCmUEkfgENFdUaflWO
 7ftQ==
X-Gm-Message-State: AOAM5336QzxFxsLXhgW90Q/j6RPZPajiQPZ2FzCZtMqF18/FEewRJcUR
 WDaJxWlAl/A0Puk9fA5BVKI=
X-Google-Smtp-Source: ABdhPJwSLG2nJ/s2aJyqjLoRzlpNT/jkEbmhfYg2OHWfEm5RLYiq3iP9n9FdRbVdUHCVfr8UUSz6LQ==
X-Received: by 2002:adf:d20c:: with SMTP id j12mr4729579wrh.76.1614367405841; 
 Fri, 26 Feb 2021 11:23:25 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
 by smtp.gmail.com with ESMTPSA id t23sm13630703wmn.13.2021.02.26.11.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 11:23:25 -0800 (PST)
Message-ID: <141f3098744ea8d1cc39abcdce89c0e513bfbc70.camel@gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Hartley Sweeten
 <hsweeten@visionengravers.com>
Date: Fri, 26 Feb 2021 20:23:24 +0100
In-Reply-To: <20210226164345.3889993-1-arnd@kernel.org>
References: <20210226164345.3889993-1-arnd@kernel.org>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_142328_904126_2A1D0168 
X-CRM114-Status: GOOD (  22.51  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210226192324.YqJmYvy82viKRtZGTx_cXx-qvHxeOw5QlsbW9NlN0r8@z>

SGkhCgpPbiBGcmksIDIwMjEtMDItMjYgYXQgMTc6NDMgKzAxMDAsIEFybmQgQmVyZ21hbm4gd3Jv
dGU6Cj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBSYW5kY29uZmln
IGJ1aWxkcyB3aXRoIGVwOTN4eCBmYWlsIHdpdGggdGhlIGNsYW5nIGludGVncmF0ZWQKPiBhc3Nl
bWJsZXIgdGhhdCBkb2VzIG5vdCB1bmRlcnN0YW5kIHRoZSBtYXZlcmljayBjcnVuY2ggZXh0ZW5z
aW9uczoKPiAKPiBhcmNoL2FybS9tYWNoLWVwOTN4eC9jcnVuY2gtYml0cy5TOjk0OjI6IGVycm9y
OiBpbnZhbGlkIGluc3RydWN0aW9uCj4gwqBjZnN0cjY0IG12ZHgwLCBbcjEsICMwXSBAIHNhdmUg
NjRiIHJlZ2lzdGVycwo+IAo+IEl0IGlzIHVuY2xlYXIgaWYgYW55b25lIGlzIHN0aWxsIHVzaW5n
IHN1cHBvcnQgZm9yIGNydW5jaDogZ2NjLTQuOCBkcm9wcGVkCj4gaXQgaW4gMjAxMiB3aGVuIGl0
IHdhcyBhbHJlYWR5IHRvbyBicm9rZW4gdG8gYmUgdXNlZCByZWxpYWJsZWQuIGdsaWJjCj4gc3Vw
cG9ydCBleGlzdGVkIGFzIGFuIGV4dGVybmFsIHBhdGNoIGJ1dCB3YXMgbmV2ZXIgbWVyZ2VkIHVw
c3RyZWFtLgo+IFdlIGNvdWxkIGNvbnNpZGVyIHJlbW92aW5nIHRoZSBsYXN0IGJpdHMgb2YgdGhl
IGtlcm5lbCBzdXBwb3J0IGFzIHdlbGwuCgpUaGlzIHdhcyBteSBpbXByZXNzaW9uIGFscmVhZHkg
aW4gMjAwNiwgdGhhdCBDaXJydXMgaXMgbm90IGdvaW5nIHRvIHdvcmsKb24gQ3J1bmNoIHN1cHBv
cnQuIEZyb20gbXkgUG9WIGl0J3MgT0sgdG8gcmVtb3ZlIHRoZSBzdXBwb3J0IGluIHRoZQprZXJu
ZWwgY29tcGxldGVseS4KCj4gVHVybiBvZmYgdGhlIGludGVncmF0ZWQgYXNzZW1ibGVyIGZvciB0
aGlzIGZpbGUgZm9yIG5vdy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5k
QGFybmRiLmRlPgo+IC0tLQo+IMKgYXJjaC9hcm0vbWFjaC1lcDkzeHgvTWFrZWZpbGUgfCAyICst
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1lcDkzeHgvTWFrZWZpbGUgYi9hcmNoL2FybS9tYWNo
LWVwOTN4eC9NYWtlZmlsZQo+IGluZGV4IDg2NzY4NDk1ZjYxZC4uZjY4NjU3N2JhMDU5IDEwMDY0
NAo+IC0tLSBhL2FyY2gvYXJtL21hY2gtZXA5M3h4L01ha2VmaWxlCj4gKysrIGIvYXJjaC9hcm0v
bWFjaC1lcDkzeHgvTWFrZWZpbGUKPiBAQCAtNyw3ICs3LDcgQEAgb2JqLXnCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDo9IGNvcmUubyBjbG9jay5vIHRpbWVyLWVwOTN4eC5v
Cj4gwqBvYmotJChDT05GSUdfRVA5M1hYX0RNQSnCoMKgwqDCoMKgwqDCoCs9IGRtYS5vCj4gwqAK
PiDCoG9iai0kKENPTkZJR19DUlVOQ0gpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCs9IGNydW5jaC5v
IGNydW5jaC1iaXRzLm8KPiAtQUZMQUdTX2NydW5jaC1iaXRzLm/CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgOj0gLVdhLC1tY3B1PWVwOTMxMgo+ICtBRkxBR1NfY3J1bmNoLWJpdHMub8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqA6PSAtV2EsLW1jcHU9ZXA5MzEyICQoY2Mtb3B0aW9uLCAtZm5vLWludGVncmF0
ZWQtYXMpCj4gwqAKPiDCoG9iai0kKENPTkZJR19NQUNIX0FEU1NQSEVSRSnCoMKgwqArPSBhZHNz
cGhlcmUubwo+IMKgb2JqLSQoQ09ORklHX01BQ0hfRURCOTNYWCnCoMKgwqDCoMKgKz0gZWRiOTN4
eC5vCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
