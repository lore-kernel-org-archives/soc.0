Return-Path: <SRS0=55Mi=IU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C30C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Mar 2021 15:12:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FFF06198B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Mar 2021 15:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FFF06198B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KNFBAWjq2IjwXzjH8myzfhgy4jTYY0WghDnnFiuyMFI=; b=XxzXdkyq+AJkdbU92vL/hpXBn
	KzAuoPz9xrbPbzdhSD5aO66OPbPRjbDNY3salkAjW0CE+5E5xuk9dY9wGB2FBGk4/NGqQind9Zuky
	WcSAcIHe5Wuv+5UtdsYBSRHE86vgsPrIqVOa0fjY8fRNbMHwBwfdciZ23fg9FL+qOHakyN6fAxm3y
	apW3qRYG4o3B2fuLIEUEPkvKaUixzCyG0sGTRTi7xdXfkfPyRRdVA2tApuMwdoeQ/viC1EMWOnAes
	klgr+8/UL1YhJHr+VAIPy4SBSbNxgVcnBGWpIKjp4IWMEIvaCIYQBkZJwLY16gWQiI/oa6jA5GomN
	luSOplO/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOMCv-00Brcv-J4; Mon, 22 Mar 2021 15:11:05 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOMCn-00Brbb-4i
 for linux-arm-kernel@lists.infradead.org; Mon, 22 Mar 2021 15:11:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id dm8so19814360edb.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 22 Mar 2021 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BblDdmrktMK5tFFD4LOpFP77ijBklviaU26xu4C63tQ=;
 b=IT2iGJQyBA7Y1+dCJvTIJziErQmWcbn0+kMr4Y273pDNqodHvB6Ww7nGeAozLlDj16
 AaZFlWmlmAzS7zUACjHtiaCrXpOhiRROiQFyU4auZ+13hpjjdqVYNePQ5Cyp/9DkkrQC
 b91OFvMWYHKs9MAA7wM3CC0WQRuzxtVRw66hiamNYNrYJOlJE43oIsVGuMZ9kLPAqUbQ
 nynbvcEhIJeX2PlbMuKhnlTT65dd9GDFO83TYP0QzGcN6dLgdO2DDjR1KDBGvGzAifvT
 3iM6ErE3HQUX/Nd9uR6OnpKDyBISmiXqsi9ileg7sykq6tbAiP06wPIgKKPW7GTaZvHL
 iZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BblDdmrktMK5tFFD4LOpFP77ijBklviaU26xu4C63tQ=;
 b=qIaP/uEZjCcemeOFpBYdoPhoS3HvfsH3PqzcPWA7OcXecbSNTfGRxdd8rkPuy597Q2
 vaM5NYqYbq4Sr0vXDt/ekE0q+NkPZHlgjkJR8LRBA9tJQPBsipLeNt1lt9DYEWRBuxps
 21U10mNEgJPAOUDqwo/qiNGEomyzMoS66FpGiHbuPnjysMW6cFoq7Fz3lRZ4H+ckPf9W
 2d/57Y1H4xIFxMxuf96lOE8Y74gtN+//EaDfYD4N/fDpjaSjoAPiNMIhYskVpJ+L4LB1
 +MBTy9kZ2dgFAI/XvdpfCvvCq+Ch807Wo5TITWjmnz881LsWtc036IPecOesNt+UFaYP
 nu1A==
X-Gm-Message-State: AOAM531WLt4PmySzWiH6u7T9yYC48jowPfKsFnfDs9UyD7pQLE7hlPYY
 WUFhSw3fLJAH32k/WjiWHfyAJw==
X-Google-Smtp-Source: ABdhPJwxMVa4A4qij3tXD3Epc4EsEgsbfdMWBHLOdKIarJBUoxpk8xvIYdSjs+oVvVNjC/1HEN64aQ==
X-Received: by 2002:a05:6402:22b5:: with SMTP id
 cx21mr26421224edb.27.1616425856228; 
 Mon, 22 Mar 2021 08:10:56 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id e4sm9768413ejz.4.2021.03.22.08.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:10:55 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:10:53 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 03/15] mfd: altera: merge ARCH_SOCFPGA and
 ARCH_STRATIX10
Message-ID: <20210322151053.GB2916463@dell>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311152545.1317581-4-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_151058_520902_008EA622 
X-CRM114-Status: GOOD (  17.37  )
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
Message-ID: <20210322151053.tgPezXi1cAONAXKd5REQWQ_F8RfqMzBnDbsYRu1X3iY@z>

T24gVGh1LCAxMSBNYXIgMjAyMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gU2ltcGxp
ZnkgMzItYml0IGFuZCA2NC1iaXQgSW50ZWwgU29DRlBHQSBLY29uZmlnIG9wdGlvbnMgYnkgaGF2
aW5nIG9ubHkKPiBvbmUgZm9yIGJvdGggb2YgdGhlbS4gIFRoaXMgdGhlIGNvbW1vbiBwcmFjdGlj
ZSBmb3Igb3RoZXIgcGxhdGZvcm1zLgo+IEFkZGl0aW9uYWxseSwgdGhlIEFSQ0hfU09DRlBHQSBp
cyB0b28gZ2VuZXJpYyBhcyBTb0NGUEdBIGRlc2lnbnMgY29tZQo+IGZyb20gbXVsdGlwbGUgdmVu
ZG9ycy4KPiAKPiBUaGUgc2lkZSBlZmZlY3QgaXMgdGhhdCB0aGUgTUZEX0FMVEVSQV9BMTBTUiB3
aWxsIG5vdyBiZSBhdmFpbGFibGUgZm9yCj4gYm90aCAzMi1iaXQgYW5kIDY0LWJpdCBJbnRlbCBT
b0NGUEdBLCBldmVuIHRob3VnaCBpdCBpcyB1c2VkIG9ubHkgZm9yCj4gMzItYml0Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fu
b25pY2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvS2NvbmZpZyB8IDQgKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
ClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJv
b2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
