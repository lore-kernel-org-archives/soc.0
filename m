Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0037C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 18:22:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92D21222B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 18:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92D21222B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7BVN0RxHqPhnP2ZhBYQe4gsgjZoOvNvOfyD0GkjlyWY=; b=k3Clm54me2IqIB3RN+4pbLKpZ
	MyIrGbby7n+LKmcyjFbgd8Xd+nbKZkAI0+jhoblafatt5WPE2PsJwHI7HO7g9I1QyVGOyl+O0J/QO
	ldYs9gSlF4LP89lgP1Yp0iszW6UUx7bZkDysHWlvwyaD60DuSfYPYaUuhERIy8k2Sr4lNycxv6YOv
	qX349fO4V4fWujS2hgpB2uQ0J+lG8wAvVflBl4Ur0mDAJOazAENnu3xmPzgulG4Suh/ZxCJKePjZj
	8iguD3gVckzLhqiMirkYK68ArnQZN2y15i2AxKfAD4DE20FsebP7RE+EIy7KJuUvPNA1MDWfKWqKv
	Jo+RePpzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Tii-00026M-Q3; Fri, 15 Jan 2021 18:21:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Tif-00025m-Cx
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 18:21:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A2B923A58;
 Fri, 15 Jan 2021 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610734868;
 bh=6QiqIlmR7WlzanFDxJUT65TOIwyU+ERfnpGteDoQbVM=;
 h=From:To:List-Id:Cc:In-Reply-To:References:Subject:Date:From;
 b=ouCp3K0KJYjcJA7aEuqZGWpuY3wby8/OJ8R1z4D4kMyzOaMdEJ5GwImSuK5Vly3JG
 JXBz8csl+tIZFTBKnHNQY+kojrAir3Kb3VFq0FzYC6dSWC1BSAACJePaJTAWm1VCmH
 kNjW3YaYZk88l3Bs5F44CIH4UOfgAtuyvv9oCIJBxIAv1xmH/r6P8wLNbWUFcTdqbl
 L14NTPjhGlBVk4kohr6b32Gg7jMSWAMUDnxyW7qEy6IBohVTKL0r4AQqfAV+1H0dVl
 gyAPBbYEdMrWtSsN6JgjIeY3xqS8aIN+axey2Ws4vczYcOueEAEMFYUzLx6Y8+gG93
 jZqF4QK4rqhcQ==
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
References: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH v1 0/7] Remove ARM platform efm32
Message-ID: <161073482877.12522.15707372087584975608.b4-ty@kernel.org>
Date: Fri, 15 Jan 2021 18:20:28 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_132109_535135_4946CF6E 
X-CRM114-Status: GOOD (  14.16  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, Uwe Kleine-König <uwe.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, soc@kernel.org, linux-i2c@vger.kernel.org, kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115182028.DG3yF9OYxIvDp66_C6YVb8AsEbA7rAcPuAkLjThOrD8@z>

T24gVGh1LCAxNCBKYW4gMjAyMSAxNjoxNjoyMyArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gdGhlcmUgYXJlIG5vIGtub3duIGFjdGl2ZSB1c2VycyBvZiB0aGUgZWZtMzIgcGxhdGZv
cm0uIEdpdmVuIHRoYXQgdGhlCj4gb25seSBtYWNoaW5lIHRoYXQgaXMgc3VwcG9ydGVkIGhhcyBv
bmx5IDQgTWlCIG9mIFJBTSBpdHMgdXNlIGlzIGFsc28KPiBxdWl0ZSBsaW1pdGVkLgo+IAo+IEJh
Y2sgdGhlbiBpdCBzZXJ2ZWQgYXMgdGhlIHBsYXRmb3JtIHRvIGRldmVsb3AgQVJNdjctTSBzdXBw
b3J0IGluIExpbnV4Cj4gd2hpY2ggd2FzIHF1aXRlIGZ1biBhbmQgc3RpbGwgaXMgYSBibGlzc2Z1
bCBtZW1vcnkuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8KCiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc3BpLmdpdCBmb3ItbmV4dAoKVGhh
bmtzIQoKWzQvN10gc3BpOiBEcm9wIHVudXNlZCBlZm0zMiBidXMgZHJpdmVyCiAgICAgIGNvbW1p
dDogMGJhODgyYWUyODE4MTkzNDg3YjcwYWQzOTYyMjk3MzUzODcxMWQ5YQoKQWxsIGJlaW5nIHdl
bGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwgYmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1u
ZXh0CnRyZWUgKHVzdWFsbHkgc29tZXRpbWUgaW4gdGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50
IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBtZXJnZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBp
cyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmCnByb2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhl
IHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJldmVydGVkLgoKWW91IG1heSBnZXQgZnVydGhlciBl
LW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9tYXRlZCBvciBtYW51YWwgdGVzdGluZwphbmQgcmV2
aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5nYWdlIHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9i
bGVtcyBhbmQKc2VuZCBmb2xsb3d1cCBwYXRjaGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0
IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuCgpJZiBhbnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3Ig
eW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIgY2hhbmdlcyB0aGV5CnNob3VsZCBiZSBzZW50IGFz
IGluY3JlbWVudGFsIHVwZGF0ZXMgYWdhaW5zdCBjdXJyZW50IGdpdCwgZXhpc3RpbmcKcGF0Y2hl
cyB3aWxsIG5vdCBiZSByZXBsYWNlZC4KClBsZWFzZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFu
ZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdoZW4gcmVwbHlpbmcKdG8gdGhpcyBtYWlsLgoKVGhh
bmtzLApNYXJrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
