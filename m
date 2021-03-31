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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48F7C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 21:50:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5206161059
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 21:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5206161059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gxrx5cH+bmFmeP72lunAe90pNTFQi6gpNe9/PI8rYvE=; b=b5wAuO2kicLiSAXDRMCNyHdTY
	vtuJBQFOGZktVqP7+uMM86098vM4ntuayA7hKzxDja2H+EKhxf5pF720qXWfGkQX9uWgo7hG8VHMT
	XX/i0GQZlq5PLBwdxeuGDn+pTjXRJbt+z1iKJF7flFfClEh7ucDJdI3nfHVVDJZi4n6f0LvnZ79n+
	QvNvqd7+37mFL3Cq/l7h1qLXALAMkf9MPNiyg0TwSZMkvTs618p4pQISyp1TdjPS4cuff7jVNrPzm
	mAKGitcUVNGzbbdflC41oO+AS4Y2Rmo/itGRMfvYJqdeyKHLVFMkZvcGXsvntHAckvdWmNlxtVY0T
	VL9h8CbuQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRihK-007kmk-Vc; Wed, 31 Mar 2021 21:48:23 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRihG-007kkg-60
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 21:48:20 +0000
Received: by mail-pf1-x42e.google.com with SMTP id 11so15495826pfn.9
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 31 Mar 2021 14:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QxwbFNGWRYXm1HiDbgF11Bs9rZKtKZ9CCG1+aVTkq+M=;
 b=CnX/Z9Py6pTQ1I2p7AnUknT9diXcMDz+Ygk7+vtocc2TbExrmpnLlgzVc59Tqst9ct
 /tPymd3xh89gRjPyFarZS4URfNc89VMsdKYL6iobLrMGgndfg3zZaFOTwlXuSLqFRfKF
 fyozmm5vFAl39ODKtHFEwSZgI2tWJpW2dSccr5IIH10BYGfc0PUbUGJXvvs/pX5xvc5r
 BhCfcfBteO0ANfZShRrMWC4Olmh9m25qeeaJPCVkG1kiEPGzp65xi4sKSMDb5UabL5Ho
 KbN2I2Gnt+sm0DvqA5unsIXNNw3s2KEUL8Tw3QkN2cezc5ql8FWQMVsRS24LySrqk5vw
 K+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QxwbFNGWRYXm1HiDbgF11Bs9rZKtKZ9CCG1+aVTkq+M=;
 b=aK3VwdIyN08gNt3RXz1hnfJE/9j7TGeOt2JDz3aA9OQBrcU6JA/3JOoIXKrdjedq7z
 GcW+NcHs2YSzQmG9HwACWSenAOLEqe9UVHwE0v7Xe2SUoKDePmhYnxxhpMTcRUHShfrl
 MbloBdlNf6r1erf4Fev1GFDkWf3+koJWxxDRe1nR3JKOHGof4Ta0dyJdV58+qbh2wvKZ
 Odvq29BVGing94JJETSVoC5AEDyCrYyGrXjEY0eL41sIqsH/v75zh7lry6ClKTRGuxXl
 ulZppaVICmOcMzf1Bgg7G3VxMUQpQNsFmQjvVr13AbLVNQ2mizjz0jS53Zz4HKGq2Bav
 kfcw==
X-Gm-Message-State: AOAM532P7AVCrt43eyIJNdJ8lkYcIJTJjUY4MO8yY4lyn6dTIAXCvn7V
 OR8rjUsAkgs//6TKKLJhCKQ=
X-Google-Smtp-Source: ABdhPJzzMDB1hCSMHfd2CbV2YmmOtNWFPCpGHZfkaqADWmP23D5Q+DHb4gHqqC037vaVQ8+4/GK6Ig==
X-Received: by 2002:a65:5a4a:: with SMTP id z10mr4844600pgs.240.1617227296132; 
 Wed, 31 Mar 2021 14:48:16 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id d5sm2900928pjo.12.2021.03.31.14.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 14:48:15 -0700 (PDT)
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 5.13
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
 olof@lixom.net, khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
 <498a63cbc96cd52210260e6d0229ad74@milecki.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c71b8949-b709-cb5b-b5a4-87cebf8cd8df@gmail.com>
Date: Wed, 31 Mar 2021 14:48:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <498a63cbc96cd52210260e6d0229ad74@milecki.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_224818_309031_0409596C 
X-CRM114-Status: GOOD (  15.23  )
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
Message-ID: <20210331214813.A41C_nwW-hWfNGbNWR_9UlbFYKxMKAETRsJRV9mpP9A@z>

T24gMy8zMS8yMSAyOjM2IFBNLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gT24gMjAyMS0wMy0z
MCAyMDo0MCwgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPj4gVGhlIGZvbGxvd2luZyBjaGFuZ2Vz
IHNpbmNlIGNvbW1pdAo+PiBmZTA3YmZkYTJmYjljZGVmOGE0ZDQwMDhhNDA5YmIwMmYzNWYxYmQ4
Ogo+Pgo+PiDCoCBMaW51eCA1LjEyLXJjMSAoMjAyMS0wMi0yOCAxNjowNToxOSAtMDgwMCkKPj4K
Pj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4+Cj4+IMKgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9Ccm9hZGNvbS9zdGJsaW51eC5naXQKPj4gdGFncy9hcm0tc29jL2Zvci01
LjEzL2RldmljZXRyZWUKPj4KPj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGRjYjU2
ZDYxZDVhOGFjY2EwYTM1N2NjNjAzMzk3YmMwMjcyY2U0Y2I6Cj4+Cj4+IMKgIEFSTTogZHRzOiBC
Q001MzAxWDogU2V0IExpbmtzeXMgRUE5NTAwIHBvd2VyIExFRCAoMjAyMS0wMy0yOQo+PiAxMTo0
Mzo0NSAtMDcwMCkKPiAKPiBUaGlzIG9uZSBzZWVtcyBhIGJpdCBjb25mdXNpbmcuCj4gCj4gQ29t
bWFuZDoKPiBnaXQgbG9nIGFybS1zb2MvZm9yLTUuMTMvZGV2aWNldHJlZQo+IHNob3dzIG1lIG9u
bHkgMiBvZiBtZW50aW9uZWQgY29tbWl0cwo+IAo+IFdlYiBVSToKPiBodHRwczovL2dpdGh1Yi5j
b20vQnJvYWRjb20vc3RibGludXgvcmVsZWFzZXMvdGFnL2FybS1zb2MlMkZmb3ItNS4xMyUyRmRl
dmljZXRyZWUKPiAKPiByZWZlcmVuY2VzIGRjYjU2ZDYgYnV0IG9wZW5pbmcgaXQgc2hvd3MgcGFn
ZSB3aXRoIGEgd2FybmluZzoKPiAiVGhpcyBjb21taXQgZG9lcyBub3QgYmVsb25nIHRvIGFueSBi
cmFuY2ggb24gdGhpcyByZXBvc2l0b3J5LCBhbmQgbWF5Cj4gYmVsb25nIHRvIGEgZm9yayBvdXRz
aWRlIG9mIHRoZSByZXBvc2l0b3J5LiIKPiAKPiBNeSBndWVzcyBpZiB5b3UgZGlkbid0IHB1c2gg
eW91ciBsb2NhbCBkZXZpY2V0cmVlL25leHQgYnJhbmNoLgoKSSBkaWQgYW5kIHRoZW4gb3Zlcndy
b3RlIGl0LCBpdCBzaG91bGQgc2hvdyB1cCBjb3JyZWN0bHkgbm93LgotLSAKRmxvcmlhbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=
