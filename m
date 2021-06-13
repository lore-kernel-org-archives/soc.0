Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322E1C48BCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 02:10:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B0561105
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 02:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9B0561105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=acMAeKIAACWHwDLOzgEIb4E+YiQUgQGthOmGYihzi5A=; b=2TtC0mq9igZe+R6HPbQwnT/54/
	Mw03qrCL+ZCyFwXxTpMYGhxOg4gQmd/6/UxVd+1W8QfjE5yX/8w4ou0j4UDYn7kaBMJ/lT07fk057
	/FzCa7sXvqjl/hEcS+kzmXAfvOyUQUFzXamDBjJrOR79sTqxpe+Fy4BQpFd+ciJrg1ZU/gfZPZpSZ
	CnE9l37Zf8LI9MIV0AU8kTZQveEecbeWkxn4jTJWp5CuQEk5J8AHFwjjiAWoFFKnlR8bJZ0jjHJm0
	xkju2E6hN7UtvCnLu1DXJB179i4pLDZ6FFS6kc533yOhin0OXh3Q09slu+7z4bf9uyLDPT3YliUvv
	4mAJbQbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsFWL-009Srl-GP; Sun, 13 Jun 2021 02:06:41 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsFWH-009SoE-Ja
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 02:06:39 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so8015642pjz.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 12 Jun 2021 19:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GXniuSw9ZMF00jtVBbwWdNTHC0JQ2hlRGU6EisXwcVc=;
 b=XtYIKlxgbuwqIrJ/SFXLecxdONWGKycr4SZNgxgEOfoVsTwcZATs5qOSeWb0ICjbrW
 0oFCIPP9x1a0Z0vTLis+8ojoMy1z7UkikPWNNrnavkV44YdqvGOLwAA+bIswzRHP1cTd
 goMPk+JGyp/pI+ycSs5Nhf41ex50VxmQOdUGOFwm4EVJ/BKnZ2RsETtcXM17LUKS+6zq
 CPO//54zmzJqjFg6i7Ni1EX+EB4HmvB1+ZX341+aC1S2u6exaWa4HbIMbeQxUqJwagGH
 Bm1L5L5fFdAoYpcXIgX19X6j5nRWPV3ZNKgGhPf8ehCkzu6UD+cC11yPAgIkuF/UznSh
 0TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GXniuSw9ZMF00jtVBbwWdNTHC0JQ2hlRGU6EisXwcVc=;
 b=N5LFTPfNy5gplSGpocEuL75ogkgqht0x8leut6Q4ZenqkeVF7m95x9ZUw+Ptrnslo2
 VcJwR/KpE5+F/mQitktG5z4FTaV3ioOknMfHCx+JfDyq4J9+/ckLf+Wr36Xuz2rnMa8y
 EVm0Q0UadEwttSbAoTqo8f+o6upMkK3VCkT06sTk606dpbRct5I74y69LTWxrrWHvMwN
 ij1cMVaywcOJKKlLEhH7qnjE8vcumb0oxdNhZiG07XCj5jaYxOvMwbFfP6H9n06jikFz
 T1Uu/B/Eak0gRRHhbbuAPAtniv+Hf57y2Bxo502bp8R7mz9o57Lw833hAOW6wCL2AW2W
 8kNg==
X-Gm-Message-State: AOAM532dWSTLYZ1XQTVa0l+asVD+rVENbSdXk9hOLUm01N7oYa7ZubrY
 OfMVtNp7ZOyaKkpWLByrssJCJzrjUvA=
X-Google-Smtp-Source: ABdhPJzZxqHRGgsczR/Ffu5hOfnCDw/t60KeaFg1sev/yKbBqB1gL39zuW+KBj84curnuugQKMeWKw==
X-Received: by 2002:a17:90a:b94c:: with SMTP id
 f12mr12110709pjw.32.1623549812731; 
 Sat, 12 Jun 2021 19:03:32 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b23sm8444278pfi.34.2021.06.12.19.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 19:03:31 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] ARM: dts: NSP: Add common bindings for MX64/MX65
To: Matthew Hagan <mnhagan88@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-4-mnhagan88@gmail.com>
 <20210611203031.fj3g32o7kgupgzjy@skbuf>
 <0f3e81be-e99a-41fe-6898-42c4d25b21be@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <670e1397-1b90-ca8d-c161-6a4c48d6bff4@gmail.com>
Date: Sat, 12 Jun 2021 19:03:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <0f3e81be-e99a-41fe-6898-42c4d25b21be@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_190637_672757_EAFF8B8E 
X-CRM114-Status: GOOD (  15.30  )
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
Message-ID: <20210613020329.R_IGW7gCEeIbkcOqjoRbuzLH-1dGBytmx4xJQWuMAIY@z>

CgpPbiA2LzEyLzIwMjEgNDoxNCBQTSwgTWF0dGhldyBIYWdhbiB3cm90ZToKW3NuaXBdCj4+PiAr
CXB3bS1sZWRzIHsKPj4+ICsJCWNvbXBhdGlibGUgPSAicHdtLWxlZHMiOwo+Pj4gKwo+Pj4gKwkJ
cmVkIHsKPj4+ICsJCQlsYWJlbCA9ICJyZWQ6bGVkIjsKPj4+ICsJCQlwd21zID0gPCZwd20gMSA1
MDAwMD47Cj4+PiArCQl9Owo+Pj4gKwo+Pj4gKwkJZ3JlZW4gewo+Pj4gKwkJCWxhYmVsID0gImdy
ZWVuOmxlZCI7Cj4+PiArCQkJcHdtcyA9IDwmcHdtIDIgNTAwMDA+Owo+Pj4gKwkJfTsKPj4+ICsK
Pj4+ICsJCWJsdWUgewo+Pj4gKwkJCWxhYmVsID0gImJsdWU6bGVkIjsKPj4+ICsJCQlwd21zID0g
PCZwd20gMyA1MDAwMD47Cj4+PiArCQl9Owo+Pj4gKwl9OwoKW3NuaXBdCgo+PiBXaGF0IGlzIHRo
ZSByZWFzb24gZm9yIG92ZXJyaWRpbmcgdGhpcyB0byAyPwo+IAo+IEkgY2FuJ3QgcHJvdmlkZSBh
biBleHBsYW5hdGlvbiBvdGhlciB0aGFuIHRoYXQgaXQgb25seSB3b3JrcyBhdCAyLgo+IAo+IFdo
ZW4gc2V0IHRvIDMgSSBnZXQgdGhlIGZvbGxvd2luZzoKPiAKPiBbwqDCoMKgIDAuNzg0MDUxXSBP
RjogL3B3bS1sZWRzL3JlZDogI3B3bS1jZWxscyA9IDMgZm91bmQgLTEKPiBbwqDCoMKgIDAuNzg5
MjAxXSBvZl9wd21fZ2V0KCk6IGNhbid0IHBhcnNlICJwd21zIiBwcm9wZXJ0eQo+IFvCoMKgwqAg
MC43OTQyOTVdIGxlZHNfcHdtIHB3bS1sZWRzOiBlcnJvciAtRUlOVkFMOiB1bmFibGUgdG8gcmVx
dWVzdCBQV00gZm9yIHJlZDpsZWQKPiBbwqDCoMKgIDAuODAxNjI4XSBsZWRzX3B3bTogcHJvYmUg
b2YgcHdtLWxlZHMgZmFpbGVkIHdpdGggZXJyb3IgLTIyCgpTdHJhbmdlIGJlY2F1c2Ugd2l0aCBh
ICNwd20tY2VsbHMgdmFsdWUgb2YgMywgb2ZfcHdtX3hsYXRlX3dpdGhfZmxhZ3MoKQp3b3VsZCB0
cmVhdCB0aGUgZmxhZ3MgYXMgb3B0aW9uYWwgc28gdGhlIHdheSB5b3UgaGF2ZSBwdXQgaXQgbG9v
a3MKY29ycmVjdCB0byBtZS4gSSBhbSBub3Qgc3VyZSB3aGF0IHRoZSBjaGFubmVsIHN1Yi1ub2Rl
cyBhcmUgc3VwcG9zZWQgdG8KZG8sIHRoZXkgZG8gbm90IGFwcGVhciB0byBiZSBkb2N1bWVudGVk
IHByb3BlcnRpZXMgb3IgcGFyc2VkIGJ5IHRoZSBQV00KY29yZT8KCklzIHlvdXIgRGV2aWNlIFRy
ZWUgcG9zc2libHkgY29ycnVwdGVkIGhlcmU/Ci0tIApGbG9yaWFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
