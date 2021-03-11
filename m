Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C092C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 18:30:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE48564FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 18:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE48564FD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OyBC8pH4Y/4n7/4ZF6JM8Alj8H8Odt3BlAi2x6ypZTY=; b=U10q3IdRXQXcTIMEvKQlP1g+8
	LREthA5xWd4MT2ptGhO15bfuMlfjnWBIGOSiAoX9qkKw3vpW5MVkh6KqsQ2tJb60cJjKOt7w3DJ15
	fi1m47mfzqOYSJyU9M15RKlniWxo3CcBvQ2RbWSyiSFndhXk4mGju16cbz140jTB0QsOmjgUR8ODr
	Si5hdv7bRjOVHulcm3hks80s9nBZJsIbtUHeA1R/Ef0BPUDZhCpOmf9a0WRUyTs0EG6V/QENVFSoa
	aP5WRpaKh4SQvbDkovZ+1hqoqM7GbFriBsSQpX5c0z2MAgV/fu2H5Y6PsV8snLRody5Xx9SEae+NT
	UXrg6yPfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKQ3H-009rql-Qe; Thu, 11 Mar 2021 18:28:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKQ1C-009rMB-0c
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 18:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/wSGYLh9BUQ/m4VK2E3Iu8L1K7AWw+HwFDDXH/P7x4=;
 b=Dt56iO4QJuJA+k3BrHjVi7X4akcMO+fRI3Op/0Vlc4YS1d0fSliXBiTt5M6YPh81npUeAo
 DONzHVH3vUzM3i7Q/rhj6Wb86BvX9R713O30qm86eYnTVWaw712H2o2v2ckbvL/zzFODWg
 NXs61CYptcr97lCFNI+HveKAq/RCz64=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-jUI3sFa2OVGJwYokmWojuw-1; Thu, 11 Mar 2021 13:26:37 -0500
X-MC-Unique: jUI3sFa2OVGJwYokmWojuw-1
Received: by mail-qk1-f199.google.com with SMTP id c1so16302036qke.8
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 10:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7/wSGYLh9BUQ/m4VK2E3Iu8L1K7AWw+HwFDDXH/P7x4=;
 b=NvqD235ZzpwMviqka7d0aakxoXrbSBhyIZ3gC/mphYaXqIoySyzlktf+D3GlMoYk6W
 7ODr0z2AsyHg/OtpRaE87P2Em9QbCYnFKRXzlwYpVE8SeDln5NEzEZXh3cMCXJWb5Up/
 v5cBEKpqTEVKZPlY4T9sn168LHUvZVQS8NNSxccT0TaR4hbrl/wN1AI1zwq1XNd5uAmP
 tJ0Bzf+4uTT2O+nr+RSCmVWj5hEUE+jC1hMtkvdVHMFpv1MkcdxLIGHC6Ai28ihM494Y
 djU7JKYbhGlDIx0itfStAIO+okAGnpAJlU41G5cifTOxm/AwOSu/RLZg21Md9vFL+/ek
 DhTg==
X-Gm-Message-State: AOAM530T6QTQZVef/pPMXK+SVkNn5feINk2x1THta89mDhsWKzfHetSC
 P+Ox4XXbxV4LMlNQTvR3EQYx53yjWppANdwjJpDWYbX8vXNpI53y57GltBAh7BHJlCkHriKruGc
 AWN7reDvKYKBndpmIpkCYzLJU4GXkqdivoCw=
X-Received: by 2002:ac8:68d:: with SMTP id f13mr8512356qth.300.1615487197327; 
 Thu, 11 Mar 2021 10:26:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykrRpLf1VdnWeXfJOmyNvXTcgKB/EbD8MxyP146EU0lCHJTfc5M6K1GGvBKnS5gI4cz7i4ig==
X-Received: by 2002:ac8:68d:: with SMTP id f13mr8512326qth.300.1615487197076; 
 Thu, 11 Mar 2021 10:26:37 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 77sm2571571qko.48.2021.03.11.10.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 10:26:36 -0800 (PST)
Subject: Re: [PATCH v3 00/15] arm64 / clk: socfpga: simplifying, cleanups and
 compile testing
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <f0b90916-9047-d5da-5cde-75d4330cf041@redhat.com>
Date: Thu, 11 Mar 2021 10:26:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_182642_222075_7DC7FC5D 
X-CRM114-Status: GOOD (  33.14  )
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
Message-ID: <20210311182632.MFejPaILP5-roZ827C48oDxfrNmMTT8F0UBXVq_N2rs@z>

Ck9uIDMvMTEvMjEgNzoyNSBBTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBIaSwKPgo+
IEFsbCB0aHJlZSBJbnRlbCBhcm02NCBTb0NGUEdBIGFyY2hpdGVjdHVyZXMgKEFnaWxleCwgTjVY
IGFuZCBTdHJhdGl4IDEwKQo+IGFyZSBiYXNpY2FsbHkgZmxhdm9ycy9wbGF0Zm9ybXMgb2YgdGhl
IHNhbWUgYXJjaGl0ZWN0dXJlLiAgQXQgbGVhc3QgZnJvbQo+IHRoZSBMaW51eCBwb2ludCBvZiB2
aWV3LiAgVXAgdG8gYSBwb2ludCB0aGF0IE41WCBhbmQgQWdpbGV4IHNoYXJlIERUU0kuCj4gSGF2
aW5nIHRocmVlIHRvcC1sZXZlbCBhcmNoaXRlY3R1cmVzIGZvciB0aGUgc2FtZSBvbmUgYmFyZWx5
IG1ha2VzCj4gc2Vuc2UgYW5kIGNvbXBsaWNhdGVzIGRyaXZlciBzZWxlY3Rpb24uCj4KPiBBZGRp
dGlvbmFsbHkgaXQgd2FzIHBvaW50ZWQgb3V0IHRoYXQgQVJDSF9TT0NGUEdBIG5hbWUgaXMgdG9v
IGdlbmVyaWMuCj4gVGhlcmUgYXJlIG90aGVyIHZlbmRvcnMgbWFraW5nIFNvQytGUEdBIGRlc2ln
bnMsIHNvIHRoZSBuYW1lIHNob3VsZCBiZQo+IGNoYW5nZWQgdG8gaGF2ZSByZWFsIHZlbmRvciAo
Y3VycmVudGx5OiBJbnRlbCkuCj4KPgo+IERlcGVuZGVuY2llcyAvIG1lcmdpbmcKPiA9PT09PT09
PT09PT09PT09PT09PT09Cj4gMS4gUGF0Y2ggMSBpcyB1c2VkIGFzIGJhc2UsIHNvIG90aGVyIGNo
YW5nZXMgZGVwZW5kIG9uIGl0cyBodW5rcy4KPiAgICBJIHB1dCBpdCBhdCBiZWdpbm5pbmcgYXMg
aXQgaXMgc29tZXRoaW5nIGNsb3NlIHRvIGEgZml4LCBzbyBjYW5kaWRhdGUKPiAgICBmb3Igc3Rh
YmxlIChldmVuIHRob3VnaCBJIGRpZCBub3QgbWFyayBpdCBsaWtlIHRoYXQpLgo+IDIuIFBhdGNo
IDI6IGV2ZXJ5dGhpbmcgZGVwZW5kcyBvbiBpdC4KPgo+IDMuIDY0LWJpdCBwYXRoOgo+IDNhLiBQ
YXRjaGVzIDMtNzogZGVwZW5kIG9uIHBhdGNoIDIsIGZyb20gNjQtYml0IHBvaW50IG9mIHZpZXcu
Cj4gM2IuIFBhdGNoIDg6IGRlcGVuZHMgb24gMi03IGFzIGl0IGZpbmFsbHkgcmVtb3ZlcyA2NC1i
aXQgQVJDSF9YWFgKPiAgICAgc3ltYm9scy4KPgo+IDQuIDMyLWJpdCBwYXRoOgo+IDRhLiBQYXRj
aGVzIDktMTQ6IGRlcGVuZCBvbiAyLCBmcm9tIDMyLWJpdCBwb2ludCBvZiB2aWV3Lgo+IDRiLiBQ
YXRjaCAxNTogZGVwZW5kcyBvbiA5LTE0IGFzIGl0IGZpbmFsbHkgcmVtb3ZlcyAzMi1iaXQgQVJD
SF9TT0NGUEdBCj4gICAgIHN5bWJvbC4KPgo+IElmIHRoZSBwYXRjaGVzIGxvb2sgZ29vZCwgcHJv
cG9zZWQgbWVyZ2luZyBpcyB2aWEgU29DIHRyZWUgKGFmdGVyCj4gZ2V0dGluZyBhY2tzIGZyb20g
ZXZlcnlvbmUpLiBTaGFyaW5nIGltbXV0YWJsZSBicmFuY2hlcyBpcyBhbHNvIGEgd2F5Lgo+Cj4K
PiBDaGFuZ2VzIHNpbmNlIHYyCj4gPT09PT09PT09PT09PT09PQo+IDEuIFNldmVyYWwgbmV3IHBh
dGNoZXMgYW5kIGNoYW5nZXMuCj4gMi4gUmVuYW1lIEFSQ0hfU09DRlBHQSB0byBBUkNIX0lOVEVM
X1NPQ0ZQR0Egb24gMzItYml0IGFuZCA2NC1iaXQuCj4gMy4gRW5hYmxlIGNvbXBpbGUgdGVzdGlu
ZyBvZiAzMi1iaXQgc29jZnBnYSBjbG9jayBkcml2ZXJzLgo+IDQuIFNwbGl0IGNoYW5nZXMgcGVy
IHN1YnN5c3RlbXMgZm9yIGVhc2llciByZXZpZXcuCj4gNS4gSSBhbHJlYWR5IHJlY2VpdmVkIGFu
IGFjayBmcm9tIExlZSBKb25lcywgYnV0IEkgZGlkIG5vdCBhZGQgaXQgYXMKPiAgICB0aGVyZSB3
YXMgYmlnIHJlZmFjdG9yaW5nLiAgUGxlYXNlIGtpbmRseSBhY2sgb25lIG1vcmUgdGltZSBpZiBp
dAo+ICAgIGxvb2tzIGdvb2QuCj4KPiBDaGFuZ2VzIHNpbmNlIHYxCj4gPT09PT09PT09PT09PT09
PQo+IDEuIE5ldyBwYXRjaCAzOiBhcm02NDogc29jZnBnYTogcmVuYW1lIEFSQ0hfU1RSQVRJWDEw
IHRvIEFSQ0hfU09DRlBHQTY0Lgo+IDIuIE5ldyBwYXRjaCA0OiBhcm02NDogaW50ZWw6IG1lcmdl
IEFnaWxleCBhbmQgTjVYIGludG8gQVJDSF9TT0NGUEdBNjQuCj4gMy4gRml4IGJ1aWxkIGlzLnN1
ZSByZXBvcnRlZCBieSBrZXJuZWwgdGVzdCByb2JvdCAod2l0aCBBUkNIX1NUUkFUSVgxMAo+ICAg
IGFuZCBDT01QSUxFX1RFU1QgYnV0IHdpdGhvdXQgc2VsZWN0aW5nIHNvbWUgb2YgdGhlIGNsb2Nr
cykuCj4KPgo+IFJGVAo+ID09PQo+IEkgdGVzdGVkIGNvbXBpbGUgYnVpbGRzIG9uIGZldyBjb25m
aWd1cmF0aW9ucywgc28gSSBob3BlIGtidWlsZCAwLWRheQo+IHdpbGwgY2hlY2sgbW9yZSBvcHRp
b25zIChwbGVhc2UgZ2l2ZSBpdCBmZXcgZGF5cyBvbiB0aGUgbGlzdHMpLgo+IEkgY29tcGFyZSB0
aGUgZ2VuZXJhdGVkIGF1dG9jb25mLmggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gIFRlc3Rpbmcgb24g
cmVhbAo+IGhhcmR3YXJlIHdvdWxkIGJlIGFwcHJlY2lhdGVkLgo+Cj4gQmVzdCByZWdhcmRzLAo+
IEtyenlzenRvZgo+Cj4gS3J6eXN6dG9mIEtvemxvd3NraSAoMTUpOgo+ICAgY2xrOiBzb2NmcGdh
OiBhbGxvdyBidWlsZGluZyBONVggY2xvY2tzIHdpdGggQVJDSF9ONVgKPiAgIEFSTTogc29jZnBn
YTogaW50cm9kdWNlIGNvbW1vbiBBUkNIX0lOVEVMX1NPQ0ZQR0EKPiAgIG1mZDogYWx0ZXJhOiBt
ZXJnZSBBUkNIX1NPQ0ZQR0EgYW5kIEFSQ0hfU1RSQVRJWDEwCj4gICBuZXQ6IHN0bW1hYzogbWVy
Z2UgQVJDSF9TT0NGUEdBIGFuZCBBUkNIX1NUUkFUSVgxMAo+ICAgY2xrOiBzb2NmcGdhOiBidWls
ZCB0b2dldGhlciBTdHJhdGl4IDEwLCBBZ2lsZXggYW5kIE41WCBjbG9jayBkcml2ZXJzCj4gICBj
bGs6IHNvY2ZwZ2E6IG1lcmdlIEFSQ0hfU09DRlBHQSBhbmQgQVJDSF9TVFJBVElYMTAKPiAgIEVE
QUM6IGFsdGVyYTogbWVyZ2UgQVJDSF9TT0NGUEdBIGFuZCBBUkNIX1NUUkFUSVgxMAo+ICAgYXJt
NjQ6IHNvY2ZwZ2E6IG1lcmdlIEFnaWxleCBhbmQgTjVYIGludG8gQVJDSF9JTlRFTF9TT0NGUEdB
Cj4gICBjbGs6IHNvY2ZwZ2E6IGFsbG93IGNvbXBpbGUgdGVzdGluZyBvZiBTdHJhdGl4IDEwIC8g
QWdpbGV4IGNsb2Nrcwo+ICAgY2xrOiBzb2NmcGdhOiB1c2UgQVJDSF9JTlRFTF9TT0NGUEdBIGFs
c28gZm9yIDMyLWJpdCBBUk0gU29DcyAoYW5kCj4gICAgIGNvbXBpbGUgdGVzdCkKPiAgIGRtYWVu
Z2luZTogc29jZnBnYTogdXNlIEFSQ0hfSU5URUxfU09DRlBHQSBhbHNvIGZvciAzMi1iaXQgQVJN
IFNvQ3MKPiAgIGZwZ2E6IGFsdGVyYTogdXNlIEFSQ0hfSU5URUxfU09DRlBHQSBhbHNvIGZvciAz
Mi1iaXQgQVJNIFNvQ3MKPiAgIGkyYzogYWx0ZXJhOiB1c2UgQVJDSF9JTlRFTF9TT0NGUEdBIGFs
c28gZm9yIDMyLWJpdCBBUk0gU29Dcwo+ICAgcmVzZXQ6IHNvY2ZwZ2E6IHVzZSBBUkNIX0lOVEVM
X1NPQ0ZQR0EgYWxzbyBmb3IgMzItYml0IEFSTSBTb0NzCj4gICBBUk06IHNvY2ZwZ2E6IGRyb3Ag
QVJDSF9TT0NGUEdBCj4KPiAgYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gIGFyY2gvYXJtL0tjb25maWcuZGVidWcgICAgICAgICAgICAgICAgICAg
ICAgfCAgNiArKystLS0KPiAgYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgfCAgMiArLQo+ICBhcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZyAgICAgICAg
IHwgIDIgKy0KPiAgYXJjaC9hcm0vY29uZmlncy9zb2NmcGdhX2RlZmNvbmZpZyAgICAgICAgICB8
ICAyICstCj4gIGFyY2gvYXJtL21hY2gtc29jZnBnYS9LY29uZmlnICAgICAgICAgICAgICAgfCAg
NCArKy0tCj4gIGFyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMgICAgICAgICAgICAgICAgfCAx
NyArKysrLS0tLS0tLS0tLS0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsdGVyYS9NYWtlZmls
ZSAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC9NYWtlZmlsZSAg
ICAgICAgICB8ICA2ICsrKy0tLQo+ICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAg
ICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvY2xrL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvY2xrL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvY2xrL3NvY2ZwZ2EvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgfCAxOSArKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvY2xrL3NvY2ZwZ2EvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgfCAxMSArKysrKy0tLS0tLQo+ICBkcml2ZXJzL2RtYS9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9lZGFjL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvZWRhYy9hbHRlcmFf
ZWRhYy5jICAgICAgICAgICAgICAgICAgfCAxNyArKysrKysrKysrKy0tLS0tLQo+ICBkcml2ZXJz
L2Zpcm13YXJlL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9m
cGdhL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKystLS0tCj4gIGRyaXZl
cnMvaTJjL2J1c3Nlcy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJz
L21mZC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnIHwgIDQgKystLQo+ICBkcml2ZXJz
L3Jlc2V0L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIDI0IGZp
bGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvc29jZnBnYS9LY29uZmlnCj4KVGhhbmtzIGZvciBjaGFu
Z2luZyB0aGUgY29uZmlnIG5hbWUuCgpQbGVhc2UgcmV2aWV3IGNoZWNrcGF0Y2ggLS1zdHJpY3Qg
b24gdGhpcyBzZXQsIHRoZSB0eXBpY2FsIGNvbXBsYWludCBpcwoKY2xrOiBzb2NmcGdhOiB1c2Ug
QVJDSF9JTlRFTF9TT0NGUEdBIGFsc28gZm9yIDMyLWJpdCBBUk0gU29DcyAoYW5kIGNvbXBpbGUg
dGVzdCnCoMKgwqDCoApXQVJOSU5HOiBwbGVhc2Ugd3JpdGUgYSBwYXJhZ3JhcGggdGhhdCBkZXNj
cmliZXMgdGhlIGNvbmZpZyBzeW1ib2wgZnVsbHkKIzM1OiBGSUxFOiBkcml2ZXJzL2Nsay9zb2Nm
cGcvS2NvbmZpZzoxMTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgCitjb25maWcgQ0xLX0lOVEVMX1NPQ0ZQR0EzMgoKVG9tCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
