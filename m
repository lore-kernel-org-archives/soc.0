Return-Path: <SRS0=gHlk=GR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7E2C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Jan 2021 17:10:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A547123B1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Jan 2021 17:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A547123B1C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1TX028QAvZ+cSOkg3cVg7qhMDMFcQS8E3AGSoWV1JS4=; b=t+2gZOHA+xnWE0fumXMHn5J22
	cGB9sIyW4DLMcdHVSYzKPc0wZTeRUIZdYrDVeyl7jO847HMAPwo5Y2LxzlyBaSHXlQ+VWOWgqXHeQ
	hJphnGXcpjMk/JPJlZQjH+oLu3IiCv9fwXlxJW9+sjE0hL8UBWa3+m6ttAT2XL8BcFmcgvS8s2WWM
	GOr8/7ozLZr2QKI0cVQ8TvfR03ryfETafsQT4Y/0Se6JgIHV0VMukfkUsF20/ywGtdrrt05UPmW5y
	d2zpMMR+3ZzIbOEJWS0zFWM42Au3bwJDCSDCyV/nzPqoIply9dXWD3djUh2RwloaiqToFtGdaeCxY
	JzehG/RIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l04N4-0003Qa-6v; Thu, 14 Jan 2021 15:17:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l04MX-0003Ek-Fs
 for linux-arm-kernel@lists.infradead.org; Thu, 14 Jan 2021 15:16:42 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l04MT-00022k-Lx; Thu, 14 Jan 2021 16:16:33 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l04MT-000133-B6; Thu, 14 Jan 2021 16:16:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v1 6/7] tty: Drop unused efm32 serial driver
Date: Thu, 14 Jan 2021 16:16:29 +0100
Message-ID: <20210114151630.128830-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
References: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_101637_636169_045C171A 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: soc@kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210114151629.f9s-Dxv0jZKS4yElkneNCU_nC1xvsAUZL5FB_Xij6QE@z>

U3VwcG9ydCBmb3IgdGhpcyBtYWNoaW5lIHdhcyBqdXN0IHJlbW92ZWQsIHNvIGRyb3AgdGhlIG5v
dyB1bnVzZWQgVUFSVApkcml2ZXIsIHRvby4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy90dHkvc2Vy
aWFsL0tjb25maWcgICAgICAgfCAxMyAtLS0tLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
TWFrZWZpbGUgICAgICB8ICAxIC0KIGluY2x1ZGUvdWFwaS9saW51eC9zZXJpYWxfY29yZS5oIHwg
IDMgLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnIGIvZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcKaW5k
ZXggMzRhMjg5OWU2OWMwLi44M2Y2Y2E0YmYyMTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3Nl
cmlhbC9LY29uZmlnCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCkBAIC0xMjk1LDE0
ICsxMjk1LDYgQEAgY29uZmlnIFNFUklBTF9BUjkzM1hfTlJfVUFSVFMKIAkgIFNldCB0aGlzIHRv
IHRoZSBudW1iZXIgb2Ygc2VyaWFsIHBvcnRzIHlvdSB3YW50IHRoZSBkcml2ZXIKIAkgIHRvIHN1
cHBvcnQuCiAKLWNvbmZpZyBTRVJJQUxfRUZNMzJfVUFSVAotCXRyaXN0YXRlICJFRk0zMiBVQVJU
L1VTQVJUIHBvcnQiCi0JZGVwZW5kcyBvbiBBUk0gJiYgKEFSQ0hfRUZNMzIgfHwgQ09NUElMRV9U
RVNUKQotCXNlbGVjdCBTRVJJQUxfQ09SRQotCWhlbHAKLQkgIFRoaXMgZHJpdmVyIHN1cHBvcnQg
dGhlIFVTQVJUIGFuZCBVQVJUIHBvcnRzIG9uCi0JICBFbmVyZ3kgTWljcm8ncyBlZm0zMiBTb0Nz
LgotCiBjb25maWcgU0VSSUFMX01QUzJfVUFSVF9DT05TT0xFCiAJYm9vbCAiTVBTMiBVQVJUIGNv
bnNvbGUgc3VwcG9ydCIKIAlkZXBlbmRzIG9uIFNFUklBTF9NUFMyX1VBUlQKQEAgLTEzMTYsMTEg
KzEzMDgsNiBAQCBjb25maWcgU0VSSUFMX01QUzJfVUFSVAogCWhlbHAKIAkgIFRoaXMgZHJpdmVy
IHN1cHBvcnQgdGhlIFVBUlQgcG9ydHMgb24gQVJNIE1QUzIuCiAKLWNvbmZpZyBTRVJJQUxfRUZN
MzJfVUFSVF9DT05TT0xFCi0JYm9vbCAiRUZNMzIgVUFSVC9VU0FSVCBjb25zb2xlIHN1cHBvcnQi
Ci0JZGVwZW5kcyBvbiBTRVJJQUxfRUZNMzJfVUFSVD15Ci0Jc2VsZWN0IFNFUklBTF9DT1JFX0NP
TlNPTEUKLQogY29uZmlnIFNFUklBTF9BUkMKIAl0cmlzdGF0ZSAiQVJDIFVBUlQgZHJpdmVyIHN1
cHBvcnQiCiAJc2VsZWN0IFNFUklBTF9DT1JFCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJp
YWwvTWFrZWZpbGUgYi9kcml2ZXJzL3R0eS9zZXJpYWwvTWFrZWZpbGUKaW5kZXggYjg1ZDUzZjll
OWZmLi5lYzJiNzQwOTFmMGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9NYWtlZmls
ZQorKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvTWFrZWZpbGUKQEAgLTczLDcgKzczLDYgQEAgb2Jq
LSQoQ09ORklHX1NFUklBTF9TSVJGU09DKSArPSBzaXJmc29jX3VhcnQubwogb2JqLSQoQ09ORklH
X1NFUklBTF9URUdSQSkgKz0gc2VyaWFsLXRlZ3JhLm8KIG9iai0kKENPTkZJR19TRVJJQUxfVEVH
UkFfVENVKSArPSB0ZWdyYS10Y3Uubwogb2JqLSQoQ09ORklHX1NFUklBTF9BUjkzM1gpICAgKz0g
YXI5MzN4X3VhcnQubwotb2JqLSQoQ09ORklHX1NFUklBTF9FRk0zMl9VQVJUKSArPSBlZm0zMi11
YXJ0Lm8KIG9iai0kKENPTkZJR19TRVJJQUxfQVJDKQkrPSBhcmNfdWFydC5vCiBvYmotJChDT05G
SUdfU0VSSUFMX1JQMikJKz0gcnAyLm8KIG9iai0kKENPTkZJR19TRVJJQUxfRlNMX0xQVUFSVCkJ
Kz0gZnNsX2xwdWFydC5vCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvc2VyaWFsX2Nv
cmUuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9zZXJpYWxfY29yZS5oCmluZGV4IDYyYzIyMDQ1ZmU2
NS4uYzQwNDJkY2ZkYzBjIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvc2VyaWFsX2Nv
cmUuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgvc2VyaWFsX2NvcmUuaApAQCAtMjA4LDkgKzIw
OCw2IEBACiAvKiBBdGhlcm9zIEFSOTMzWCBTb0MgKi8KICNkZWZpbmUgUE9SVF9BUjkzM1gJOTkK
IAotLyogRW5lcmd5IE1pY3JvIGVmbTMyIFNvQyAqLwotI2RlZmluZSBQT1JUX0VGTVVBUlQgICAx
MDAKLQogLyogQVJDIChTeW5vcHN5cykgb24tY2hpcCBVQVJUICovCiAjZGVmaW5lIFBPUlRfQVJD
ICAgICAgIDEwMQogCi0tIAoyLjI5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
