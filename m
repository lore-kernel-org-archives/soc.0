Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECF1C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 22:10:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F2C61078
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 22:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3F2C61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6sMiugFfipoVZrRgbIoeL4fEm0o5/9y0DXdta+4w0vE=; b=NLa5KG3kGqCQwYFv1ps4WqW//
	71QGgUQpB8r5aYNXlgNshGnwbmpDe3yVBZQMmvLtBcCbnp3SlPhDOn4yaxBwr1savkdZRtrlDw23U
	O8kQN3Xg+VkT3kQUf+kGFxdeJ0UpPA3jLzk6uH8IfmhKBXia/yb5t9eu13bx6Wn1DNVNdo/BZ4249
	yHzJP7PDApyXrEEzyEacbOQ1w2ymJWaKUsBN89wmOsUAVJrjQUxrZCcOKSNASOxdoqBW0555BvIM7
	S48pXPsULLllfj+QuTxtgGk3cnTRNyRYVWqMlJumROLrdkzBzUbQxeWVK/4Q6KNyv78wd2/fc2mbq
	O+rlX7E5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRj0d-007nXf-8X; Wed, 31 Mar 2021 22:08:19 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRj0Y-007nVi-5x
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 22:08:16 +0000
Received: by mail-pg1-x529.google.com with SMTP id l76so269445pga.6
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 31 Mar 2021 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=auQcH4kQTAWsybz5oxIwhgFg24UDR3gcUAooovC8mYU=;
 b=JmjAQ+nIJGDi+hhgfxQNLC5/yaWvx2r6unUcGfUtRiqx1A3jcarIRRXostm7LDuO0Y
 ZHHrUt3o6MmBd3BXIesvEoTibkvlyINDlFMxrrb7bs7J1HRqIKMbZsSeOOY5jlU3qKHl
 mA/Oc/o5PSfbhOSxmZSNvN88N4dHfMiXVSwNGfrAO8c7qoSp1f8yC49ut1Yf5feuE6Ay
 7pP/xJBJUEIODvJeUujdcdX35w15EE6TtyVtYtPwPL25fwVvwuvYdjVzps6TOywWa8cY
 MAEYgNkHp9cYBpnR+Gk22H6PIavqUxkF64UWt1FhQTT698PaiyXVyiZUQonWxpnKJv03
 YPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=auQcH4kQTAWsybz5oxIwhgFg24UDR3gcUAooovC8mYU=;
 b=uXTEmNXOk352nNg8+2eKuSqOp37ebh1s9h/g0HZAIDQnHdfjxObF7n0DBXaluTQNXY
 ArZ3ULIj21RvkaVpiNUDBOjdvHpOIhmA3O9u8AEkDXPikVW2ykh6YSV85ZoXZuAlXvvJ
 h3fN36prwkKfd1dUmErFnrIbedT2Ka9vz9fGgGtFo9QZJatxlAQ9vfBP548LYMAvIJWs
 d8LFutuidBfzkipxsMRKyaBuHzPF06pUL2cCsv2NLlvG1tgeRGyAnjcfDadZD0uRKQws
 LH9P4PIOiPx/3EscnEeDNAd90pu1s96/OSfWYtwYEsiCcAs+C7PzHD4ntw03/8Hzafaf
 NKzg==
X-Gm-Message-State: AOAM530qO0ti4mYMYluzo+hbJAieM4OCBTRf26DRaRR+MBgd6u9j2D/3
 49x13PVLTty08rUFzSePgbg=
X-Google-Smtp-Source: ABdhPJxF7yeRzeTkCkiGCLWIEQNr9P/uzNyMqzzq4/YtVQyifxIfk8THKdrtaeDKr9AdcCtwzsTx5A==
X-Received: by 2002:aa7:9ecf:0:b029:1f4:f737:12d6 with SMTP id
 r15-20020aa79ecf0000b02901f4f73712d6mr4899366pfq.8.1617228492627; 
 Wed, 31 Mar 2021 15:08:12 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id i11sm3523484pfo.35.2021.03.31.15.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 15:08:12 -0700 (PDT)
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 5.13
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
 olof@lixom.net, khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
 <498a63cbc96cd52210260e6d0229ad74@milecki.pl>
 <c71b8949-b709-cb5b-b5a4-87cebf8cd8df@gmail.com>
 <213cdda3ff9ab8fba6fc840bfcb57383@milecki.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a8091fe8-26ac-504a-9cca-d40180f6d835@gmail.com>
Date: Wed, 31 Mar 2021 15:08:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <213cdda3ff9ab8fba6fc840bfcb57383@milecki.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_230814_469436_8552B6C7 
X-CRM114-Status: GOOD (  13.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210331220810.Bc-qT_mcZRIlphPWfLNK-rULswSTP7XKDsCQf8Ukp6U@z>

T24gMy8zMS8yMSAzOjA2IFBNLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gT24gMjAyMS0wMy0z
MSAyMzo0OCwgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPj4gT24gMy8zMS8yMSAyOjM2IFBNLCBS
YWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4+PiBPbiAyMDIxLTAzLTMwIDIwOjQwLCBGbG9yaWFuIEZh
aW5lbGxpIHdyb3RlOgo+Pj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQKPj4+
PiBmZTA3YmZkYTJmYjljZGVmOGE0ZDQwMDhhNDA5YmIwMmYzNWYxYmQ4Ogo+Pj4+Cj4+Pj4gwqAg
TGludXggNS4xMi1yYzEgKDIwMjEtMDItMjggMTY6MDU6MTkgLTA4MDApCj4+Pj4KPj4+PiBhcmUg
YXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPj4+Pgo+Pj4+IMKgIGh0dHBzOi8v
Z2l0aHViLmNvbS9Ccm9hZGNvbS9zdGJsaW51eC5naXQKPj4+PiB0YWdzL2FybS1zb2MvZm9yLTUu
MTMvZGV2aWNldHJlZQo+Pj4+Cj4+Pj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvCj4+
Pj4gZGNiNTZkNjFkNWE4YWNjYTBhMzU3Y2M2MDMzOTdiYzAyNzJjZTRjYjoKPj4+Pgo+Pj4+IMKg
IEFSTTogZHRzOiBCQ001MzAxWDogU2V0IExpbmtzeXMgRUE5NTAwIHBvd2VyIExFRCAoMjAyMS0w
My0yOQo+Pj4+IDExOjQzOjQ1IC0wNzAwKQo+Pj4KPj4+IFRoaXMgb25lIHNlZW1zIGEgYml0IGNv
bmZ1c2luZy4KPj4+Cj4+PiBDb21tYW5kOgo+Pj4gZ2l0IGxvZyBhcm0tc29jL2Zvci01LjEzL2Rl
dmljZXRyZWUKPj4+IHNob3dzIG1lIG9ubHkgMiBvZiBtZW50aW9uZWQgY29tbWl0cwo+Pj4KPj4+
IFdlYiBVSToKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9Ccm9hZGNvbS9zdGJsaW51eC9yZWxlYXNl
cy90YWcvYXJtLXNvYyUyRmZvci01LjEzJTJGZGV2aWNldHJlZQo+Pj4KPj4+Cj4+PiByZWZlcmVu
Y2VzIGRjYjU2ZDYgYnV0IG9wZW5pbmcgaXQgc2hvd3MgcGFnZSB3aXRoIGEgd2FybmluZzoKPj4+
ICJUaGlzIGNvbW1pdCBkb2VzIG5vdCBiZWxvbmcgdG8gYW55IGJyYW5jaCBvbiB0aGlzIHJlcG9z
aXRvcnksIGFuZCBtYXkKPj4+IGJlbG9uZyB0byBhIGZvcmsgb3V0c2lkZSBvZiB0aGUgcmVwb3Np
dG9yeS4iCj4+Pgo+Pj4gTXkgZ3Vlc3MgaWYgeW91IGRpZG4ndCBwdXNoIHlvdXIgbG9jYWwgZGV2
aWNldHJlZS9uZXh0IGJyYW5jaC4KPj4KPj4gSSBkaWQgYW5kIHRoZW4gb3Zlcndyb3RlIGl0LCBp
dCBzaG91bGQgc2hvdyB1cCBjb3JyZWN0bHkgbm93Lgo+IAo+IEkgdGhpbmsgeW91IGp1c3QgcHVz
aGVkIGRyaXZlcnMvbmV4dCBpbnN0ZWFkIG9mIGRldmljZXRyZWUvbmV4dC4KCkh1bXBmLCB5ZXMs
IG5vdyBmaXhlZC4KLS0gCkZsb3JpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
