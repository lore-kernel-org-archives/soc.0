Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A128C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 15:53:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3DAF2388B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 15:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3DAF2388B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tloFJtAEkhQqwj5r0iQh1/i0rpKYjm8X50kh/fauatE=; b=kH7wlksBQg1icedUgJPd/L5j23
	AHNdr1qLZeh0pXUq/OtvNpVU0CjwRaMk71/3cYN9gqIgy0ymI1XZyOCqAXTYrQsEcWpXld+WOL6aa
	23o1zoL0eo07wlZlwATrveF1qaYGdlumn98jkCwR8w9NYK+Mgs5/QJDOEJocC2mTvAufAp4VF2pVR
	13HFIJIXzVI7Z47yg7Hr2rKR2K3jBHw7JRA7+ebSAzYa8pib2ZaabUo03TPK6A941GfC6WfxfoQl9
	l6Opl7fJ16tguoMjATJyShnF0qRQ3X+sF6nr3x7PFShXsrkXTL+eBVcu7qTXoyL238PhfM7tLMZFH
	ISHuv9Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0ROJ-0007Nj-Go; Fri, 15 Jan 2021 15:51:59 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0RO1-0007K9-14
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 15:51:44 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l0RNt-0003NK-0o; Fri, 15 Jan 2021 16:51:33 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l0RNr-0008LH-RE; Fri, 15 Jan 2021 16:51:31 +0100
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
Subject: [PATCH v2 0/7] Remove ARM platform efm32
Date: Fri, 15 Jan 2021 16:51:23 +0100
Message-ID: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_105141_184026_719E5DF6 
X-CRM114-Status: GOOD (  18.37  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, soc@kernel.org,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115155123.Bz5y4iXqTmFg0weEtcUDatk-PFnqoCNHDbSzo0LdriE@z>

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4KCkhlbGxvLAoK
Y29tcGFyZWQgdG8gdjEgKE1lc3NhZ2UtSWQ6CjIwMjEwMTE0MTUxNjMwLjEyODgzMC0xLXUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZSkgSSBkaWQgdGhlIGZvbGxvd2luZyBjaGFuZ2VzOgoK
IC0gYWRkICJzZXJpYWwiIHRvIHRoZSBzdW1tYXJ5IGxpbmUgb2YgdGhlIHBhdGNoIHJlbW92aW5n
IHRoZSBzZXJpYWwKICAgZHJpdmVyCiAtIGFjdHVhbGx5IHJlbW92ZSB0aGUgc2VyaWFsIGRyaXZl
ciBpbiB0aGUgcGF0Y2ggdGhhdCBjbGFpbXMgdG8gZG8gdGhpcwogICBpbnN0ZWFkIG9mIHBhdGNo
IDEuCgpPbiBpcmMgQXJuZCBzaWduYWxsZWQgdG8gd2FudCB0byBtZXJnZSB0aGUgZmlyc3QgcGF0
Y2guIEFzIHRoZXJlIGFyZSBubwpoYXJkIGludGVyZGVwZW5kZW5jaWVzIGJldHdlZW4gdGhlc2Us
IEkgdGhpbmsgdGhlIGJlc3QgYXBwcm9hY2ggaXMgZm9yIHRoZQppbmRpdmlkdWFsIG1haW50YWlu
ZXJzIHRvIHBpY2sgdXAgdGhlIHBhdGNoZXMgdGhleSBhcmUgcmVzcG9uc2libGUgZm9yLgoKVGhh
bmtzIGFuZCBiZXN0IHJlZ2FyZHMsClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDcpOgogIEFSTTog
ZHJvcCBlZm0zMiBwbGF0Zm9ybQogIGNsazogRHJvcCB1bnVzZWQgZWZtMzJnZyBkcml2ZXIKICBj
bG9ja3NvdXJjZTogRHJvcCB1bnVzZWQgZWZtMzIgdGltZXIgY29kZQogIHNwaTogRHJvcCB1bnVz
ZWQgZWZtMzIgYnVzIGRyaXZlcgogIGkyYzogRHJvcCB1bnVzZWQgZWZtMzIgYnVzIGRyaXZlcgog
IHR0eTogc2VyaWFsOiBEcm9wIHVudXNlZCBlZm0zMiBzZXJpYWwgZHJpdmVyCiAgTUFJTlRBSU5F
UlM6IFJlbW92ZSBkZWxldGVkIHBsYXRmb3JtIGVmbTMyCgogTUFJTlRBSU5FUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNyAtCiBhcmNoL2FybS9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEwICstCiBhcmNoL2FybS9LY29uZmlnLmRlYnVnICAgICAgICAgICAg
ICAgICAgIHwgIDE3IC0KIGFyY2gvYXJtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDEgLQogYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAgMiAt
CiBhcmNoL2FybS9ib290L2R0cy9lZm0zMmdnLWRrMzc1MC5kdHMgICAgIHwgIDg4IC0tLQogYXJj
aC9hcm0vYm9vdC9kdHMvZWZtMzJnZy5kdHNpICAgICAgICAgICB8IDE3NyAtLS0tLQogYXJjaC9h
cm0vY29uZmlncy9lZm0zMl9kZWZjb25maWcgICAgICAgICB8ICA5OCAtLS0KIGFyY2gvYXJtL2lu
Y2x1ZGUvZGVidWcvZWZtMzIuUyAgICAgICAgICAgfCAgNDUgLS0KIGFyY2gvYXJtL21hY2gtZWZt
MzIvTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDIgLQogYXJjaC9hcm0vbWFjaC1lZm0zMi9NYWtl
ZmlsZS5ib290ICAgICAgICB8ICAgNCAtCiBhcmNoL2FybS9tYWNoLWVmbTMyL2R0bWFjaGluZS5j
ICAgICAgICAgIHwgIDE2IC0KIGFyY2gvYXJtL21tL0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgLQogZHJpdmVycy9jbGsvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAg
MSAtCiBkcml2ZXJzL2Nsay9jbGstZWZtMzJnZy5jICAgICAgICAgICAgICAgIHwgIDg0IC0tLQog
ZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnICAgICAgICAgICAgICB8ICAgOSAtCiBkcml2ZXJz
L2Nsb2Nrc291cmNlL01ha2VmaWxlICAgICAgICAgICAgIHwgICAxIC0KIGRyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItZWZtMzIuYyAgICAgICAgfCAyNzggLS0tLS0tLS0KIGRyaXZlcnMvaTJjL2J1
c3Nlcy9LY29uZmlnICAgICAgICAgICAgICAgfCAgIDcgLQogZHJpdmVycy9pMmMvYnVzc2VzL01h
a2VmaWxlICAgICAgICAgICAgICB8ICAgMSAtCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWVmbTMy
LmMgICAgICAgICAgIHwgNDY5IC0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvc3BpL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDcgLQogZHJpdmVycy9zcGkvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICB8ICAgMSAtCiBkcml2ZXJzL3NwaS9zcGktZWZtMzIuYyAgICAgICAgICAgICAg
ICAgIHwgNDYyIC0tLS0tLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcgICAgICAg
ICAgICAgICB8ICAxMyAtCiBkcml2ZXJzL3R0eS9zZXJpYWwvTWFrZWZpbGUgICAgICAgICAgICAg
IHwgICAxIC0KIGRyaXZlcnMvdHR5L3NlcmlhbC9lZm0zMi11YXJ0LmMgICAgICAgICAgfCA4NTIg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9lZm0z
Mi1zcGkuaCAgfCAgMTUgLQogaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2VmbTMyLXVhcnQu
aCB8ICAxOSAtCiBpbmNsdWRlL3VhcGkvbGludXgvc2VyaWFsX2NvcmUuaCAgICAgICAgIHwgICAz
IC0KIDMwIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyNjkwIGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL2VmbTMyZ2ctZGszNzUwLmR0cwog
ZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL2VmbTMyZ2cuZHRzaQogZGVsZXRl
IG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2NvbmZpZ3MvZWZtMzJfZGVmY29uZmlnCiBkZWxldGUgbW9k
ZSAxMDA2NDQgYXJjaC9hcm0vaW5jbHVkZS9kZWJ1Zy9lZm0zMi5TCiBkZWxldGUgbW9kZSAxMDA2
NDQgYXJjaC9hcm0vbWFjaC1lZm0zMi9NYWtlZmlsZQogZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtL21hY2gtZWZtMzIvTWFrZWZpbGUuYm9vdAogZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJt
L21hY2gtZWZtMzIvZHRtYWNoaW5lLmMKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9j
bGstZWZtMzJnZy5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1l
ci1lZm0zMi5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1lZm0z
Mi5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zcGkvc3BpLWVmbTMyLmMKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3R0eS9zZXJpYWwvZWZtMzItdWFydC5jCiBkZWxldGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2VmbTMyLXNwaS5oCiBkZWxldGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2VmbTMyLXVhcnQuaAoKCmJhc2Ut
Y29tbWl0OiA1YzhmZTU4M2NjZTU0MmFhMGI4NGFkYzkzOWNlODUyOTNkZTM2ZTVlCi0tIAoyLjI5
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCg==
