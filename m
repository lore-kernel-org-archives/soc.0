Return-Path: <SRS0=DAyh=HU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE89C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Feb 2021 06:06:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4CB060241
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Feb 2021 06:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4CB060241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1GY9nb/lRufSajq+N882/sDp/rqvK5PKqCM3oHzSfnk=; b=lBi8WmzNiSeQQQu+y/Ekl9uHR
	D+4VfVhEZKh4Yfyi27e7nCNYU8NSq3XTFvO2kjHY0cjTqbFK2dOTMx//faDES4SqXdzzUdW2I55x5
	gbtRh1vw7GQdVCtT+cZqCFPyrcfM5tikjFV8dYD2bP8kT7DjV/PRI8dZ2uKlGP60Blx5+dZ8iZPA+
	vidqPYyCiUzva91lXp6up1U03qQvqHaukJKc631yRg6WOJwRAUGIUK7fJ70XAU6iAcWYET9KhXK+d
	t2Icw+V7Om0j17+jT6OKujrzNMzo5BhUUVhuAeXphqWFJvKX33qJkl/+9k9O+vMlpdcae/9cXgCk0
	kZ6eD7CbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCcRI-0005OB-Lh; Thu, 18 Feb 2021 06:05:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCcRF-0005My-GV
 for linux-arm-kernel@lists.infradead.org; Thu, 18 Feb 2021 06:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613628320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4q+YxVSVW16DE0+d+Y+BYB1zXwlSir3yUCLZoTFOt0=;
 b=A76W3x/CdJM6JkRrA0Hma9N2NumsfVZquFLawAFapLZniQEU+dv8N3u2/sf1Ob/aK2Wifa
 sWM0SjJftBt/tjqGwjy69UETknZiDiTVdlCxEroSuQZMWQmJ0/NEQeWLnBCW3EqlM3hAXI
 kNGXtJdHoh35plELRDb0ORyCdrbSrGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-PZmTWchaOh2HvEa0I-vBkg-1; Thu, 18 Feb 2021 01:05:15 -0500
X-MC-Unique: PZmTWchaOh2HvEa0I-vBkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C659E801965;
 Thu, 18 Feb 2021 06:05:12 +0000 (UTC)
Received: from [10.72.13.28] (ovpn-13-28.pek2.redhat.com [10.72.13.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFAFC6A03D;
 Thu, 18 Feb 2021 06:05:00 +0000 (UTC)
Subject: Re: [PATCH] arm64: defconfig: enable modern virtio pci device
To: Arnd Bergmann <arnd@kernel.org>, Anders Roxell <anders.roxell@linaro.org>
References: <20210210190506.1923684-1-anders.roxell@linaro.org>
 <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fffdfa8f-38c1-6fd1-d043-8a4f476213dc@redhat.com>
Date: Thu, 18 Feb 2021 14:04:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_010521_648205_3FDDDAF6 
X-CRM114-Status: GOOD (  19.81  )
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
Cc: Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-xtensa@linux-xtensa.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 virtualization@lists.linux-foundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, SoC Team <soc@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210218060459.Yy2d6ATFo_tEZwfaP1_eLGBfIs7-wW7tlzCX6J4UZzU@z>

Ck9uIDIwMjEvMi8xMSDkuIvljYg3OjUyLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IE9uIFdlZCwg
RmViIDEwLCAyMDIxIGF0IDg6MDUgUE0gQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5h
cm8ub3JnPiB3cm90ZToKPj4gU2luY2UgcGF0Y2ggKCJ2aXJ0aW8tcGNpOiBpbnRyb2R1Y2UgbW9k
ZXJuIGRldmljZSBtb2R1bGUiKSBnb3QgYWRkZWQgaXQKPj4gaXMgbm90IHBvc3NpYmxlIHRvIGJv
b3QgYSBkZWZjb25maWcga2VybmVsIGluIHFlbXUgd2l0aCBhIHZpcnRpbyBwY2kKPj4gZGV2aWNl
LiAgQWRkIENPTkZJR19WSVJUSU9fUENJX01PREVSTj15IGZyYWdtZW50IG1ha2VzIHRoZSBrZXJu
ZWwgYWJsZQo+PiB0byBib290Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRlcnMgUm94ZWxsIDxh
bmRlcnMucm94ZWxsQGxpbmFyby5vcmc+Cj4+IC0tLQo+PiAgIGFyY2gvYXJtL2NvbmZpZ3MvbXVs
dGlfdjdfZGVmY29uZmlnICAgICAgICAgfCAxICsKPj4gICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVm
Y29uZmlnICAgICAgICAgICAgICAgIHwgMSArCj4gQWNrZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+Cj4KPiBNaWNoYWVsLCBjYW4geW91IHBpY2sgdGhpcyB1cCBpbiB0aGUgdmhv
c3QgdHJlZSB0aGF0IGludHJvZHVjZXMgdGhlIHJlZ3Jlc3Npb24/Cj4KPiAgICAgICAgICAgQXJu
ZAo+CgpIaToKCkJhc2VkIG9uIHRoZSBkaXNjdXNzaW9uIHByZXZpb3VzbHksIHRoZSBwbGFuIGlz
IHRvIHNlbGVjdCAKVklSVElPX1BDSV9NT0RFUk4sIGFuZCBkb2N1bWVudCB0aGUgbW9kdWxlIHRo
YXQgc2VsZWN0IGl0IG11c3QgZGVwZW5kIG9uIApQQ0kuCgpJIHdpbGwgcG9zdCBhIHBhdGNoIHNv
b24uCgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
