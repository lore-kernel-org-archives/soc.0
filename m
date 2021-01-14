Return-Path: <SRS0=gHlk=GR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3DBC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Jan 2021 17:06:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F0D323B31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Jan 2021 17:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F0D323B31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7jiZFdseDMDeI+ALBCwxJ+433KWeQ8kH4PumnZvD2jo=; b=bn4wPP96KSjGXartLCNlQ4vBfe
	PM9fiLM6OgAnvMXkOpQwyVCZ9iXFJ3umWZvVToXIaUrA3WIAE/FjUtQXCbNI8RBiwdAuQco04oa73
	l1444f6D/hwPW1MGQE2wHiBR3B/tMP2VUDEN2XldHyxwE7JJC/7fOs93lfURzPZfvv/VTeIJGPFxH
	zZGuNdaOzogLRGMmb11ELQeUngrVLiR3dc4zRVdbIOvMoRfEpsR0MjJ2HMKqjkpdDJSBsnRfa+LYs
	fsTZWFnqIGM9onc8v9iu/SPGEuXEYDHYbxpvwpOo7koRvicyPIyHFbrDEuTlAjBJZrcOFhZv3fgDm
	n6M8BdPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l04NP-0003Ym-Rm; Thu, 14 Jan 2021 15:17:31 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l04Mb-0003Ha-1A
 for linux-arm-kernel@lists.infradead.org; Thu, 14 Jan 2021 15:16:49 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l04MS-00021i-Rp; Thu, 14 Jan 2021 16:16:32 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l04MR-00012i-O9; Thu, 14 Jan 2021 16:16:31 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Brown <broonie@kernel.org>,
 Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v1 0/7] Remove ARM platform efm32
Date: Thu, 14 Jan 2021 16:16:23 +0100
Message-ID: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_101641_156717_9A1FD5A0 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe.kleine-koenig@pengutronix.de>,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, soc@kernel.org,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210114151623.saMkS0NDO7Qw81hC3tbmtlcMCvp1cAdnGvpnXfeWOos@z>

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHV3ZS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
PgoKSGVsbG8sCgp0aGVyZSBhcmUgbm8ga25vd24gYWN0aXZlIHVzZXJzIG9mIHRoZSBlZm0zMiBw
bGF0Zm9ybS4gR2l2ZW4gdGhhdCB0aGUKb25seSBtYWNoaW5lIHRoYXQgaXMgc3VwcG9ydGVkIGhh
cyBvbmx5IDQgTWlCIG9mIFJBTSBpdHMgdXNlIGlzIGFsc28KcXVpdGUgbGltaXRlZC4KCkJhY2sg
dGhlbiBpdCBzZXJ2ZWQgYXMgdGhlIHBsYXRmb3JtIHRvIGRldmVsb3AgQVJNdjctTSBzdXBwb3J0
IGluIExpbnV4CndoaWNoIHdhcyBxdWl0ZSBmdW4gYW5kIHN0aWxsIGlzIGEgYmxpc3NmdWwgbWVt
b3J5LgoKU3RpbGwgZ2l2ZW4gdGhhdCB0aGUgY29kZSBzZXJ2ZXMgbm8gcHVycG9zZSBhbmQgdGhp
cyBwcm9iYWJseSB3b24ndApjaGFuZ2UgYW55dGltZSBzb29uLCByZW1vdmUgYWxsIHBsYXRmb3Jt
IHN1cHBvcnQuCgpJJ20gdW5zdXJlIHdoYXQgdG8gZG8gd2l0aCB0aGUgZGV2aWNlIHRyZWUgYmlu
ZGluZ3MuIFNob3VsZCB3ZSBkZWxldGUKdGhlbSwgdG9vPwoKQmVzdCByZWdhcmRzClV3ZQoKVXdl
IEtsZWluZS1Lw7ZuaWcgKDcpOgogIEFSTTogZHJvcCBlZm0zMiBwbGF0Zm9ybQogIGNsazogRHJv
cCB1bnVzZWQgZWZtMzJnZyBkcml2ZXIKICBjbG9ja3NvdXJjZTogRHJvcCB1bnVzZWQgZWZtMzIg
dGltZXIgY29kZQogIHNwaTogRHJvcCB1bnVzZWQgZWZtMzIgYnVzIGRyaXZlcgogIGkyYzogRHJv
cCB1bnVzZWQgZWZtMzIgYnVzIGRyaXZlcgogIHR0eTogRHJvcCB1bnVzZWQgZWZtMzIgc2VyaWFs
IGRyaXZlcgogIE1BSU5UQUlORVJTOiBSZW1vdmUgZGVsZXRlZCBwbGF0Zm9ybSBlZm0zMgoKIE1B
SU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgLQogYXJjaC9hcm0v
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQogYXJjaC9hcm0vS2NvbmZp
Zy5kZWJ1ZyAgICAgICAgICAgICAgICAgICB8ICAxNyAtCiBhcmNoL2FybS9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAxIC0KIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlICAg
ICAgICAgICAgICAgfCAgIDIgLQogYXJjaC9hcm0vYm9vdC9kdHMvZWZtMzJnZy1kazM3NTAuZHRz
ICAgICB8ICA4OCAtLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2VmbTMyZ2cuZHRzaSAgICAgICAgICAg
fCAxNzcgLS0tLS0KIGFyY2gvYXJtL2NvbmZpZ3MvZWZtMzJfZGVmY29uZmlnICAgICAgICAgfCAg
OTggLS0tCiBhcmNoL2FybS9pbmNsdWRlL2RlYnVnL2VmbTMyLlMgICAgICAgICAgIHwgIDQ1IC0t
CiBhcmNoL2FybS9tYWNoLWVmbTMyL01ha2VmaWxlICAgICAgICAgICAgIHwgICAyIC0KIGFyY2gv
YXJtL21hY2gtZWZtMzIvTWFrZWZpbGUuYm9vdCAgICAgICAgfCAgIDQgLQogYXJjaC9hcm0vbWFj
aC1lZm0zMi9kdG1hY2hpbmUuYyAgICAgICAgICB8ICAxNiAtCiBhcmNoL2FybS9tbS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0KIGRyaXZlcnMvY2xrL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgLQogZHJpdmVycy9jbGsvY2xrLWVmbTMyZ2cuYyAgICAgICAg
ICAgICAgICB8ICA4NCAtLS0KIGRyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZyAgICAgICAgICAg
ICAgfCAgIDkgLQogZHJpdmVycy9jbG9ja3NvdXJjZS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAg
MSAtCiBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWVmbTMyLmMgICAgICAgIHwgMjc4IC0tLS0t
LS0tCiBkcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZpZyAgICAgICAgICAgICAgIHwgICA3IC0KIGRy
aXZlcnMvaTJjL2J1c3Nlcy9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDEgLQogZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1lZm0zMi5jICAgICAgICAgICB8IDQ2OSAtLS0tLS0tLS0tLS0tCiBkcml2
ZXJzL3NwaS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICA3IC0KIGRyaXZlcnMvc3Bp
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgLQogZHJpdmVycy9zcGkvc3BpLWVm
bTMyLmMgICAgICAgICAgICAgICAgICB8IDQ2MiAtLS0tLS0tLS0tLS0KIGRyaXZlcnMvdHR5L3Nl
cmlhbC9LY29uZmlnICAgICAgICAgICAgICAgfCAgMTMgLQogZHJpdmVycy90dHkvc2VyaWFsL01h
a2VmaWxlICAgICAgICAgICAgICB8ICAgMSAtCiBkcml2ZXJzL3R0eS9zZXJpYWwvZWZtMzItdWFy
dC5jICAgICAgICAgIHwgODUyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4
L3BsYXRmb3JtX2RhdGEvZWZtMzItc3BpLmggIHwgIDE1IC0KIGluY2x1ZGUvbGludXgvcGxhdGZv
cm1fZGF0YS9lZm0zMi11YXJ0LmggfCAgMTkgLQogaW5jbHVkZS91YXBpL2xpbnV4L3NlcmlhbF9j
b3JlLmggICAgICAgICB8ICAgMyAtCiAzMCBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MjY5MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9l
Zm0zMmdnLWRrMzc1MC5kdHMKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9l
Zm0zMmdnLmR0c2kKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9jb25maWdzL2VmbTMyX2Rl
ZmNvbmZpZwogZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2luY2x1ZGUvZGVidWcvZWZtMzIu
UwogZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL21hY2gtZWZtMzIvTWFrZWZpbGUKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9tYWNoLWVmbTMyL01ha2VmaWxlLmJvb3QKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBhcmNoL2FybS9tYWNoLWVmbTMyL2R0bWFjaGluZS5jCiBkZWxldGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9jbGsvY2xrLWVmbTMyZ2cuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvY2xvY2tzb3VyY2UvdGltZXItZWZtMzIuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtZWZtMzIuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc3BpL3Nw
aS1lZm0zMi5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy90dHkvc2VyaWFsL2VmbTMyLXVh
cnQuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9lZm0z
Mi1zcGkuaAogZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9l
Zm0zMi11YXJ0LmgKCgpiYXNlLWNvbW1pdDogNWM4ZmU1ODNjY2U1NDJhYTBiODRhZGM5MzljZTg1
MjkzZGUzNmU1ZQotLSAKMi4yOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
