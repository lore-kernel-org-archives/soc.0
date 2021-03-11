Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9EEC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 18:50:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C669A64FE0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 18:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C669A64FE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kaXcHgmlmSo4/FzIvxBxK7L6AiRAN2EV7Un9xoXfj5s=; b=TKyuNFGuaSHzKh/D+kXWZKp/8
	RHjymIZ4e2Gefg05N8EnI6ik96na7u9Pt6F5h9MG43PQVvqJ+SPja4KI8fn3r5Ugs6HHT/QhBoa3L
	tGthgn2Tlg50ivFNhQuGtYRfk0iqkXtue4WASH5R104RReYEGcCWZwagPlX/Xu7KJsl2LifzZwEz+
	Ghe6VWUQhw1OQqVLXQcCzMdJ8OBscori4QOZ3r7+SHGpjm6JgJiqnE+vhloWNnAPSHaDULJpB5WTM
	J320eAUM0OgWNz7sO1YDIerQsKzh+inZAIc+WwayldkY5gw1pNsCbGZwWVsiVVOFvihktev+ECOpZ
	wwnqQzJYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKQMS-009uIl-Fr; Thu, 11 Mar 2021 18:48:40 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKQMK-009uHM-Tm
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 18:48:35 +0000
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKQLM-0003UX-LR
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 18:47:32 +0000
Received: by mail-wr1-f71.google.com with SMTP id g5so9883168wrd.22
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 10:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGhsYhdCQ1elD24yTKdnrXd5i7xOjzN52nW5SEJ7/Fo=;
 b=PKu75yeAmwc5apUZ5Zl/TqosYkeN3lnLZ7m7jCZSYuc/c4jmUmhlQA7NeSYSP4RBaC
 ehgvDvDpLfgREIi/fsNtDzpbXYBfmxlihZmVMRx0ilrLU0nFwilHabnTzDHbob99sV/l
 tAZhwBxqhnfaPnQ+EB4QooEF8GbC27sN/nMWLd5gInptyPQStBH5hr3Cj5/Qnxn5uDYO
 /NU0JCkxmnQicWtV5Nk7TAyuq2HtqeFRYPNANA6CPWERGp1gxlsjxqMGOaTIQs4f/kkt
 Lzdr0Y56UT0D75pEur7qRP1jfgzLxD1cs0C26PHLbAhQKRDqKSdCsmvD975YPuk4pQ4V
 IARQ==
X-Gm-Message-State: AOAM5316uDkS8p3iV2QeEaiMZZpUw6SATErXH5FpdaLWNRq+y8yAkygo
 AsGhNA2q29ZZkbKG/oZjBu9NG66Id/yy6QtrHEAPVLv7yvWQvWHRH33G2UpOY9EjC12lBdnLBOC
 tG4IWRG3DT948utQwoWvZXwbEaSIhbGYjneFkd0xxQXC/IwNYUP2c
X-Received: by 2002:a5d:5141:: with SMTP id u1mr10282906wrt.31.1615488451952; 
 Thu, 11 Mar 2021 10:47:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEiONe/luicUkBQrryf9RIkvIG+x8+UJPcdgITbiuaICznSQKmKVThfd4wAkfQtdO2oa9H6A==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr10282871wrt.31.1615488451652; 
 Thu, 11 Mar 2021 10:47:31 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id h6sm4972118wmi.6.2021.03.11.10.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 10:47:31 -0800 (PST)
Subject: Re: [PATCH v3 00/15] arm64 / clk: socfpga: simplifying, cleanups and
 compile testing
List-Id: <soc.lore.kernel.org>
To: Tom Rix <trix@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
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
 <f0b90916-9047-d5da-5cde-75d4330cf041@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f581f103-270f-90ed-6946-de63b6712e82@canonical.com>
Date: Thu, 11 Mar 2021 19:47:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f0b90916-9047-d5da-5cde-75d4330cf041@redhat.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_184833_508616_B90977CA 
X-CRM114-Status: GOOD (  30.98  )
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
Message-ID: <20210311184730.r-tWZZxxNPSemG_VZ504YPVNJ40SWEmeBBPY_Pkb2kM@z>

T24gMTEvMDMvMjAyMSAxOToyNiwgVG9tIFJpeCB3cm90ZToKPiAKPiBPbiAzLzExLzIxIDc6MjUg
QU0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBBbGwgdGhyZWUgSW50
ZWwgYXJtNjQgU29DRlBHQSBhcmNoaXRlY3R1cmVzIChBZ2lsZXgsIE41WCBhbmQgU3RyYXRpeCAx
MCkKPj4gYXJlIGJhc2ljYWxseSBmbGF2b3JzL3BsYXRmb3JtcyBvZiB0aGUgc2FtZSBhcmNoaXRl
Y3R1cmUuICBBdCBsZWFzdCBmcm9tCj4+IHRoZSBMaW51eCBwb2ludCBvZiB2aWV3LiAgVXAgdG8g
YSBwb2ludCB0aGF0IE41WCBhbmQgQWdpbGV4IHNoYXJlIERUU0kuCj4+IEhhdmluZyB0aHJlZSB0
b3AtbGV2ZWwgYXJjaGl0ZWN0dXJlcyBmb3IgdGhlIHNhbWUgb25lIGJhcmVseSBtYWtlcwo+PiBz
ZW5zZSBhbmQgY29tcGxpY2F0ZXMgZHJpdmVyIHNlbGVjdGlvbi4KPj4KPj4gQWRkaXRpb25hbGx5
IGl0IHdhcyBwb2ludGVkIG91dCB0aGF0IEFSQ0hfU09DRlBHQSBuYW1lIGlzIHRvbyBnZW5lcmlj
Lgo+PiBUaGVyZSBhcmUgb3RoZXIgdmVuZG9ycyBtYWtpbmcgU29DK0ZQR0EgZGVzaWducywgc28g
dGhlIG5hbWUgc2hvdWxkIGJlCj4+IGNoYW5nZWQgdG8gaGF2ZSByZWFsIHZlbmRvciAoY3VycmVu
dGx5OiBJbnRlbCkuCj4+Cj4+Cj4+IERlcGVuZGVuY2llcyAvIG1lcmdpbmcKPj4gPT09PT09PT09
PT09PT09PT09PT09PQo+PiAxLiBQYXRjaCAxIGlzIHVzZWQgYXMgYmFzZSwgc28gb3RoZXIgY2hh
bmdlcyBkZXBlbmQgb24gaXRzIGh1bmtzLgo+PiAgICBJIHB1dCBpdCBhdCBiZWdpbm5pbmcgYXMg
aXQgaXMgc29tZXRoaW5nIGNsb3NlIHRvIGEgZml4LCBzbyBjYW5kaWRhdGUKPj4gICAgZm9yIHN0
YWJsZSAoZXZlbiB0aG91Z2ggSSBkaWQgbm90IG1hcmsgaXQgbGlrZSB0aGF0KS4KPj4gMi4gUGF0
Y2ggMjogZXZlcnl0aGluZyBkZXBlbmRzIG9uIGl0Lgo+Pgo+PiAzLiA2NC1iaXQgcGF0aDoKPj4g
M2EuIFBhdGNoZXMgMy03OiBkZXBlbmQgb24gcGF0Y2ggMiwgZnJvbSA2NC1iaXQgcG9pbnQgb2Yg
dmlldy4KPj4gM2IuIFBhdGNoIDg6IGRlcGVuZHMgb24gMi03IGFzIGl0IGZpbmFsbHkgcmVtb3Zl
cyA2NC1iaXQgQVJDSF9YWFgKPj4gICAgIHN5bWJvbHMuCj4+Cj4+IDQuIDMyLWJpdCBwYXRoOgo+
PiA0YS4gUGF0Y2hlcyA5LTE0OiBkZXBlbmQgb24gMiwgZnJvbSAzMi1iaXQgcG9pbnQgb2Ygdmll
dy4KPj4gNGIuIFBhdGNoIDE1OiBkZXBlbmRzIG9uIDktMTQgYXMgaXQgZmluYWxseSByZW1vdmVz
IDMyLWJpdCBBUkNIX1NPQ0ZQR0EKPj4gICAgIHN5bWJvbC4KPj4KPj4gSWYgdGhlIHBhdGNoZXMg
bG9vayBnb29kLCBwcm9wb3NlZCBtZXJnaW5nIGlzIHZpYSBTb0MgdHJlZSAoYWZ0ZXIKPj4gZ2V0
dGluZyBhY2tzIGZyb20gZXZlcnlvbmUpLiBTaGFyaW5nIGltbXV0YWJsZSBicmFuY2hlcyBpcyBh
bHNvIGEgd2F5Lgo+Pgo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHYyCj4+ID09PT09PT09PT09PT09PT0K
Pj4gMS4gU2V2ZXJhbCBuZXcgcGF0Y2hlcyBhbmQgY2hhbmdlcy4KPj4gMi4gUmVuYW1lIEFSQ0hf
U09DRlBHQSB0byBBUkNIX0lOVEVMX1NPQ0ZQR0Egb24gMzItYml0IGFuZCA2NC1iaXQuCj4+IDMu
IEVuYWJsZSBjb21waWxlIHRlc3Rpbmcgb2YgMzItYml0IHNvY2ZwZ2EgY2xvY2sgZHJpdmVycy4K
Pj4gNC4gU3BsaXQgY2hhbmdlcyBwZXIgc3Vic3lzdGVtcyBmb3IgZWFzaWVyIHJldmlldy4KPj4g
NS4gSSBhbHJlYWR5IHJlY2VpdmVkIGFuIGFjayBmcm9tIExlZSBKb25lcywgYnV0IEkgZGlkIG5v
dCBhZGQgaXQgYXMKPj4gICAgdGhlcmUgd2FzIGJpZyByZWZhY3RvcmluZy4gIFBsZWFzZSBraW5k
bHkgYWNrIG9uZSBtb3JlIHRpbWUgaWYgaXQKPj4gICAgbG9va3MgZ29vZC4KPj4KPj4gQ2hhbmdl
cyBzaW5jZSB2MQo+PiA9PT09PT09PT09PT09PT09Cj4+IDEuIE5ldyBwYXRjaCAzOiBhcm02NDog
c29jZnBnYTogcmVuYW1lIEFSQ0hfU1RSQVRJWDEwIHRvIEFSQ0hfU09DRlBHQTY0Lgo+PiAyLiBO
ZXcgcGF0Y2ggNDogYXJtNjQ6IGludGVsOiBtZXJnZSBBZ2lsZXggYW5kIE41WCBpbnRvIEFSQ0hf
U09DRlBHQTY0Lgo+PiAzLiBGaXggYnVpbGQgaXMuc3VlIHJlcG9ydGVkIGJ5IGtlcm5lbCB0ZXN0
IHJvYm90ICh3aXRoIEFSQ0hfU1RSQVRJWDEwCj4+ICAgIGFuZCBDT01QSUxFX1RFU1QgYnV0IHdp
dGhvdXQgc2VsZWN0aW5nIHNvbWUgb2YgdGhlIGNsb2NrcykuCj4+Cj4+Cj4+IFJGVAo+PiA9PT0K
Pj4gSSB0ZXN0ZWQgY29tcGlsZSBidWlsZHMgb24gZmV3IGNvbmZpZ3VyYXRpb25zLCBzbyBJIGhv
cGUga2J1aWxkIDAtZGF5Cj4+IHdpbGwgY2hlY2sgbW9yZSBvcHRpb25zIChwbGVhc2UgZ2l2ZSBp
dCBmZXcgZGF5cyBvbiB0aGUgbGlzdHMpLgo+PiBJIGNvbXBhcmUgdGhlIGdlbmVyYXRlZCBhdXRv
Y29uZi5oIGFuZCBmb3VuZCBubyBpc3N1ZXMuICBUZXN0aW5nIG9uIHJlYWwKPj4gaGFyZHdhcmUg
d291bGQgYmUgYXBwcmVjaWF0ZWQuCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4+
Cj4+IEtyenlzenRvZiBLb3psb3dza2kgKDE1KToKPj4gICBjbGs6IHNvY2ZwZ2E6IGFsbG93IGJ1
aWxkaW5nIE41WCBjbG9ja3Mgd2l0aCBBUkNIX041WAo+PiAgIEFSTTogc29jZnBnYTogaW50cm9k
dWNlIGNvbW1vbiBBUkNIX0lOVEVMX1NPQ0ZQR0EKPj4gICBtZmQ6IGFsdGVyYTogbWVyZ2UgQVJD
SF9TT0NGUEdBIGFuZCBBUkNIX1NUUkFUSVgxMAo+PiAgIG5ldDogc3RtbWFjOiBtZXJnZSBBUkNI
X1NPQ0ZQR0EgYW5kIEFSQ0hfU1RSQVRJWDEwCj4+ICAgY2xrOiBzb2NmcGdhOiBidWlsZCB0b2dl
dGhlciBTdHJhdGl4IDEwLCBBZ2lsZXggYW5kIE41WCBjbG9jayBkcml2ZXJzCj4+ICAgY2xrOiBz
b2NmcGdhOiBtZXJnZSBBUkNIX1NPQ0ZQR0EgYW5kIEFSQ0hfU1RSQVRJWDEwCj4+ICAgRURBQzog
YWx0ZXJhOiBtZXJnZSBBUkNIX1NPQ0ZQR0EgYW5kIEFSQ0hfU1RSQVRJWDEwCj4+ICAgYXJtNjQ6
IHNvY2ZwZ2E6IG1lcmdlIEFnaWxleCBhbmQgTjVYIGludG8gQVJDSF9JTlRFTF9TT0NGUEdBCj4+
ICAgY2xrOiBzb2NmcGdhOiBhbGxvdyBjb21waWxlIHRlc3Rpbmcgb2YgU3RyYXRpeCAxMCAvIEFn
aWxleCBjbG9ja3MKPj4gICBjbGs6IHNvY2ZwZ2E6IHVzZSBBUkNIX0lOVEVMX1NPQ0ZQR0EgYWxz
byBmb3IgMzItYml0IEFSTSBTb0NzIChhbmQKPj4gICAgIGNvbXBpbGUgdGVzdCkKPj4gICBkbWFl
bmdpbmU6IHNvY2ZwZ2E6IHVzZSBBUkNIX0lOVEVMX1NPQ0ZQR0EgYWxzbyBmb3IgMzItYml0IEFS
TSBTb0NzCj4+ICAgZnBnYTogYWx0ZXJhOiB1c2UgQVJDSF9JTlRFTF9TT0NGUEdBIGFsc28gZm9y
IDMyLWJpdCBBUk0gU29Dcwo+PiAgIGkyYzogYWx0ZXJhOiB1c2UgQVJDSF9JTlRFTF9TT0NGUEdB
IGFsc28gZm9yIDMyLWJpdCBBUk0gU29Dcwo+PiAgIHJlc2V0OiBzb2NmcGdhOiB1c2UgQVJDSF9J
TlRFTF9TT0NGUEdBIGFsc28gZm9yIDMyLWJpdCBBUk0gU29Dcwo+PiAgIEFSTTogc29jZnBnYTog
ZHJvcCBBUkNIX1NPQ0ZQR0EKPj4KPj4gIGFyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQo+PiAgYXJjaC9hcm0vS2NvbmZpZy5kZWJ1ZyAgICAgICAgICAg
ICAgICAgICAgICB8ICA2ICsrKy0tLQo+PiAgYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCj4+ICBhcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KPj4gIGFyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29u
ZmlnICAgICAgICAgfCAgMiArLQo+PiAgYXJjaC9hcm0vY29uZmlncy9zb2NmcGdhX2RlZmNvbmZp
ZyAgICAgICAgICB8ICAyICstCj4+ICBhcmNoL2FybS9tYWNoLXNvY2ZwZ2EvS2NvbmZpZyAgICAg
ICAgICAgICAgIHwgIDQgKystLQo+PiAgYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3JtcyAgICAg
ICAgICAgICAgICB8IDE3ICsrKystLS0tLS0tLS0tLS0tCj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FsdGVyYS9NYWtlZmlsZSAgICAgICAgIHwgIDIgKy0KPj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMv
aW50ZWwvTWFrZWZpbGUgICAgICAgICAgfCAgNiArKystLS0KPj4gIGFyY2gvYXJtNjQvY29uZmln
cy9kZWZjb25maWcgICAgICAgICAgICAgICAgfCAgMyArLS0KPj4gIGRyaXZlcnMvY2xrL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+ICBkcml2ZXJzL2Nsay9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+PiAgZHJpdmVycy9jbGsvc29jZnBn
YS9LY29uZmlnICAgICAgICAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysKPj4gIGRy
aXZlcnMvY2xrL3NvY2ZwZ2EvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAxMSArKysrKy0tLS0t
LQo+PiAgZHJpdmVycy9kbWEvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4+ICBkcml2ZXJzL2VkYWMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
Pj4gIGRyaXZlcnMvZWRhYy9hbHRlcmFfZWRhYy5jICAgICAgICAgICAgICAgICAgfCAxNyArKysr
KysrKysrKy0tLS0tLQo+PiAgZHJpdmVycy9maXJtd2FyZS9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4+ICBkcml2ZXJzL2ZwZ2EvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDggKysrKy0tLS0KPj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnICAgICAgICAg
ICAgICAgICAgfCAgMiArLQo+PiAgZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA0ICsrLS0KPj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L0tjb25maWcgfCAgNCArKy0tCj4+ICBkcml2ZXJzL3Jlc2V0L0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDYgKysrLS0tCj4+ICAyNCBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25z
KCspLCA1OSBkZWxldGlvbnMoLSkKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9z
b2NmcGdhL0tjb25maWcKPj4KPiBUaGFua3MgZm9yIGNoYW5naW5nIHRoZSBjb25maWcgbmFtZS4K
PiAKPiBQbGVhc2UgcmV2aWV3IGNoZWNrcGF0Y2ggLS1zdHJpY3Qgb24gdGhpcyBzZXQsIHRoZSB0
eXBpY2FsIGNvbXBsYWludCBpcwo+IAo+IGNsazogc29jZnBnYTogdXNlIEFSQ0hfSU5URUxfU09D
RlBHQSBhbHNvIGZvciAzMi1iaXQgQVJNIFNvQ3MgKGFuZCBjb21waWxlIHRlc3QpwqDCoMKgwqAK
PiBXQVJOSU5HOiBwbGVhc2Ugd3JpdGUgYSBwYXJhZ3JhcGggdGhhdCBkZXNjcmliZXMgdGhlIGNv
bmZpZyBzeW1ib2wgZnVsbHkKPiAjMzU6IEZJTEU6IGRyaXZlcnMvY2xrL3NvY2ZwZy9LY29uZmln
OjExOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiArY29u
ZmlnIENMS19JTlRFTF9TT0NGUEdBMzIKClRoaXMgc3ltYm9sIGlzIG5vdCB2aXNpYmxlIHRvIHRo
ZSB1c2VyLCBub3Qgc2VsZWN0YWJsZSwgc28gZG9jdW1lbnRpbmcKaXQgbW9yZSB0aGFuIHdoYXQg
aXMgYWxyZWFkeSB3cml0dGVuIGluIG9wdGlvbiB0aXRsZSAodGhlIG9uZSBnb2luZwphZnRlciAi
Ym9vbCIpIG1ha2VzIGxpdHRsZSBzZW5zZS4gV2UgZG9uJ3QgZG8gaXQgZm9yIHN1Y2ggZHJpdmVy
cy4KTW9zdGx5IGJlY2F1c2UgaXQgd291bGQgYmUgZHVwbGljYXRpb24gb2YgdGhlIG9wdGlvbiB0
aXRsZSBvciBpbmNsdWRlCnVzZWxlc3MgaW5mb3JtYXRpb24gKGl0J3MgbGlrZSBkb2N1bWVudGlu
ZyAiaW50IGkiIHdpdGggImNvdW50ZXIgdXNlZApmb3IgbG9vcCIpLiBUaGUgY2hlY2twYXRjaCBj
b21wbGFpbnMgaWYgdGhpcyBpcyBsZXNzIHRoYW4gdGhyZWUgbGluZXMsCmJ1dCBpdCBpcyBub3Qg
cG9zc2libGUgdG8gd3JpdGUgaGVyZSBhbnl0aGluZyBtZWFuaW5nZnVsIGZvciBtb3JlIHRoYW4K
b25lIGxpbmUuCgpSZWFsbHksIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UuIElmIHlvdSB0aGluayBv
dGhlcndpc2UsIHBsZWFzZSBzdWdnZXN0CnRoZSB0ZXh0IHdoaWNoIGlzIG5vdCBkdXBsaWNhdGlu
ZyBvcHRpb24gdGl0bGUgYW5kIGRvZXMgbm90IGluY2x1ZGUKY29tbW9uIHN0dWZmIGZyb20gY2xv
Y2tzLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
