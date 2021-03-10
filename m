Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88412C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 09:47:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E3E64FBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 09:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E3E64FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RvBKEzvHTZSDnNTO4lA7jVuw0nmfW9PK2rDqyaKICNA=; b=MRWetda+NLOsCed+Y92oAL3O4
	w+oH+yZUMjSXPMJ3XkcSGb9wVpRy3FZZFC0aIEv0WtWvb2yrLVaLa3NO8AhJ9y1p1UIVLmskXmiwt
	qGRx//iQnNqFUEorUpEwW0B/uCXP06xbgYyCTWZpGEaTE5lPWiIeBLFyNPtyaiFNKRuDTMw4Der9l
	MPJonvRV5IF2IJbao01ba/Jdq0/pZTrFmBazD8gD2t0msW04Udsmm2LQ4P0kCfuHIsny333Q+7d5x
	GpjCvdMN16bpBz5l6ie+bP5CKUXPCWtyCKAYxv+a0KGErf0LMTWbD3XT1lMjs4SyTQNNsKK2xXe/6
	J7I3MAm0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJvPM-006UcW-A3; Wed, 10 Mar 2021 09:45:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJvPH-006Uae-BU
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 09:45:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id l12so22523026wry.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 01:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0Erx94zt8ljBM/yS3nXtNjrWvctYWuUVNAQLWpYJJRo=;
 b=gmhG//67uUiQkJT3GRUTS9z+Tq+SpQbswnEQR3XBOpiU7cuv9y1ZxqWW5di7WTiU0z
 5IGBqN7qnmOOotjHLYfwHb3ymzghFWrRTY1lWccM1Jx+OctRRl2HrazL+Ie3zn+oOLg4
 +Cr93FaZA5kDLdCQdfSnM2ocPGfjV/4QFyjlmLL+A/yeCntkZRxL1Y6VHE3Ix0XGWvt0
 6g/f18dGAHNtTske/QJGnxe1q9MAz0KsF1R4s87be2nrW/bOkzR56VrkiKlK8Lct6oeX
 n8ruIEf/G85aTXWUgm6d5CINJa9ul6yAnrKIqzkWyNT+48PSH1UtSBhOAi5f8ntwPNJr
 7JyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0Erx94zt8ljBM/yS3nXtNjrWvctYWuUVNAQLWpYJJRo=;
 b=Yk36sBawXg6XduqUUsrni/QOYeRVHKM8z0KWrCl2HApEY+azIRKGAqAjhqpZuCW/+f
 /DOPWYuh77zgVjDtr6ZBs87FbUajHP+mB8n0rT1nboq1P8n679aNY+46yowCX/nh8fik
 GwLuxUzWpmgJ6Ps3ShaPWehQDkBIeVylGlfzTCL7cPzzhrry9oKX7MhfNec4GdVFm7El
 4UABRjVfazXtQ9A7fAu+3XEFrM1a02EAX2Zektr6G1CpP9btiJPYom1Q3JM7zcHvDLlQ
 IhFURC8uwlzyaz89BC5TFss+H2W6dVz8yFT50f3qoopXUcoTn0SqWN5fly44DoU2q9P7
 qcjg==
X-Gm-Message-State: AOAM530Hal0miw3s62XdpLPONtuz+HqjmkCvqGmf4OIJudUU8VdpmVJq
 c41GzL84b1tIxcsO0qoaWsJmnA==
X-Google-Smtp-Source: ABdhPJxcv9V5lAz+sEJ4HCtbzjFqfXkdmpxw/ngT7vdSlUljH3RkiAsQdLLVCP49qFAMYuC+GEIjxg==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr2649040wru.266.1615369530343; 
 Wed, 10 Mar 2021 01:45:30 -0800 (PST)
Received: from dell ([91.110.221.204])
 by smtp.gmail.com with ESMTPSA id c9sm11764201wrr.78.2021.03.10.01.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 01:45:29 -0800 (PST)
Date: Wed, 10 Mar 2021 09:45:27 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Tom Rix <trix@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
Message-ID: <20210310094527.GA701493@dell>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_094531_677891_9200751C 
X-CRM114-Status: GOOD (  12.41  )
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
Message-ID: <20210310094527.IILR6tqBR2TWpUBcUcuz-kHuipTXAqVyqgVHkxzpREQ@z>

T24gV2VkLCAxMCBNYXIgMjAyMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gUHJlcGFy
ZSBmb3IgbWVyZ2luZyBTdHJhdGl4IDEwLCBBZ2lsZXggYW5kIE41WCBpbnRvIG9uZSBhcm02NAo+
IGFyY2hpdGVjdHVyZSBieSBmaXJzdCByZW5hbWluZyB0aGUgQVJDSF9TVFJBVElYMTAgaW50byBB
UkNIX1NPQ0ZQR0E2NC4KPiAKPiBUaGUgZXhpc3RpbmcgQVJDSF9TT0NGUEdBIChpbiBBUk12Nykg
S2NvbmZpZyBzeW1ib2wgY2Fubm90IGJlIHVzZWQKPiBiZWNhdXNlIGFsdGVyYV9lZGFjIGRyaXZl
ciBidWlsZHMgZGlmZmVyZW50bHkgYmV0d2VlbiB0aGVtICh3aXRoCj4gaWZkZWZzKS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNh
bm9uaWNhbC5jb20+Cj4gLS0tCj4gIGFyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMgICAgICAg
ICAgICAgICAgfCAgNyArKysrLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWx0ZXJhL01ha2Vm
aWxlICAgICAgICAgfCAgMiArLQo+ICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9jbGsvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvY2xrL3NvY2ZwZ2EvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvZWRhYy9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2VkYWMvYWx0ZXJhX2VkYWMuYyAgICAgICAgICAgICAg
ICAgIHwgMTAgKysrKystLS0tLQo+ICBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9mcGdhL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCgo+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KCklmIGl0J3Mgb2theSB3aXRoIGV2ZXJ5b25lIGVsc2UsIGl0J2xsIGJl
IG9rYXkgd2l0aCBtZToKCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgoKPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZyB8ICA0ICsr
LS0KPiAgZHJpdmVycy9yZXNldC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIDEyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9w
ZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
