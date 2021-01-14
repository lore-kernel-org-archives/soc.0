Return-Path: <SRS0=gHlk=GR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329D6C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Jan 2021 16:20:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA7E223B3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Jan 2021 16:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA7E223B3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h8vKx0FMDwkAZK6DlNUp4flcZNh2++Rcl7O3AhiZWMw=; b=JakMCXLpjAxOyjdjIYUmtnBih
	8O7iSY48y0Ew43oNg5yxSzbvaR7mtnsG77HYvoX7b8G6Ep1VhVHa0M2g/DpihoqcolwxfNTT0l4Co
	f1Heg1ww8aLEENvKvipEe86H7Mcf49FLjCfreOnIeU4x9MXRg2yWPOUSUqrjb61NY9hOvpmZtK292
	/fq0vIgSQ/TBGFmd/28v7N74QBEmb6q2lyvzakyyq0hltN4EUe0Jp/sYltcSbIKBRS4/zcBymmRpX
	CC2Pei8grflBLoYv1drBwjjcq8zV8eTZPZ2//YMS7QMMY0mTBXf1/cwBMxBf00g9L6sc8B0+5gFEG
	A58bGkQFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l04N0-0003PU-AF; Thu, 14 Jan 2021 15:17:06 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l04MW-0003Ef-Tv
 for linux-arm-kernel@lists.infradead.org; Thu, 14 Jan 2021 15:16:41 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l04MS-00021s-O5; Thu, 14 Jan 2021 16:16:32 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l04MS-00012o-AD; Thu, 14 Jan 2021 16:16:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v1 2/7] clk: Drop unused efm32gg driver
Date: Thu, 14 Jan 2021 16:16:25 +0100
Message-ID: <20210114151630.128830-3-u.kleine-koenig@pengutronix.de>
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
X-CRM114-CacheID: sfid-20210114_101637_168218_88231AA6 
X-CRM114-Status: GOOD (  15.88  )
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
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210114151625.nNO9sthqU9lZsXujRrFKzDDb1hF-Og23TKVUhl1HmXM@z>

U3VwcG9ydCBmb3IgdGhpcyBtYWNoaW5lIHdhcyBqdXN0IHJlbW92ZWQsIHNvIGRyb3AgdGhlIG5v
dyB1bnVzZWQgY2xrCmRyaXZlciwgdG9vLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2Nsay9NYWtl
ZmlsZSAgICAgIHwgIDEgLQogZHJpdmVycy9jbGsvY2xrLWVmbTMyZ2cuYyB8IDg0IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4NSBkZWxl
dGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9jbGstZWZtMzJnZy5jCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvTWFrZWZpbGUgYi9kcml2ZXJzL2Nsay9NYWtlZmlsZQpp
bmRleCBkYmRjNTkwZTdkZTMuLmExMTk3ZDc1M2Q4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsv
TWFrZWZpbGUKKysrIGIvZHJpdmVycy9jbGsvTWFrZWZpbGUKQEAgLTI3LDcgKzI3LDYgQEAgb2Jq
LSQoQ09ORklHX0NPTU1PTl9DTEtfQ0RDRTcwNikJKz0gY2xrLWNkY2U3MDYubwogb2JqLSQoQ09O
RklHX0NPTU1PTl9DTEtfQ0RDRTkyNSkJKz0gY2xrLWNkY2U5MjUubwogb2JqLSQoQ09ORklHX0FS
Q0hfQ0xQUzcxMVgpCQkrPSBjbGstY2xwczcxMXgubwogb2JqLSQoQ09ORklHX0NPTU1PTl9DTEtf
Q1MyMDAwX0NQKQkrPSBjbGstY3MyMDAwLWNwLm8KLW9iai0kKENPTkZJR19BUkNIX0VGTTMyKQkJ
Kz0gY2xrLWVmbTMyZ2cubwogb2JqLSQoQ09ORklHX0FSQ0hfU1BBUlg1KQkJKz0gY2xrLXNwYXJ4
NS5vCiBvYmotJChDT05GSUdfQ09NTU9OX0NMS19GSVhFRF9NTUlPKQkrPSBjbGstZml4ZWQtbW1p
by5vCiBvYmotJChDT05GSUdfQ09NTU9OX0NMS19GU0xfRkxFWFNQSSkJKz0gY2xrLWZzbC1mbGV4
c3BpLm8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay1lZm0zMmdnLmMgYi9kcml2ZXJzL2Ns
ay9jbGstZWZtMzJnZy5jCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA4NWJlYWFjYjQw
ODguLjAwMDAwMDAwMDAwMAotLS0gYS9kcml2ZXJzL2Nsay9jbGstZWZtMzJnZy5jCisrKyAvZGV2
L251bGwKQEAgLTEsODQgKzAsMCBAQAotLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seQotLyoKLSAqIENvcHlyaWdodCAoQykgMjAxMyBQZW5ndXRyb25peAotICogVXdlIEts
ZWluZS1Lb2VuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLSAqLwotI2luY2x1
ZGUgPGxpbnV4L2lvLmg+Ci0jaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+Ci0jaW5jbHVk
ZSA8bGludXgvb2YuaD4KLSNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+Ci0jaW5jbHVkZSA8
bGludXgvc2xhYi5oPgotCi0jaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svZWZtMzItY211Lmg+
Ci0KLSNkZWZpbmUgQ01VX0hGUEVSQ0xLRU4wCQkweDQ0Ci0jZGVmaW5lIENNVV9NQVhfQ0xLUwkJ
MzcKLQotc3RhdGljIHN0cnVjdCBjbGtfaHdfb25lY2VsbF9kYXRhICpjbGtfZGF0YTsKLQotc3Rh
dGljIHZvaWQgX19pbml0IGVmbTMyZ2dfY211X2luaXQoc3RydWN0IGRldmljZV9ub2RlICpucCkK
LXsKLQlpbnQgaTsKLQl2b2lkIF9faW9tZW0gKmJhc2U7Ci0Jc3RydWN0IGNsa19odyAqKmh3czsK
LQotCWNsa19kYXRhID0ga3phbGxvYyhzdHJ1Y3Rfc2l6ZShjbGtfZGF0YSwgaHdzLCBDTVVfTUFY
X0NMS1MpLAotCQkJICAgR0ZQX0tFUk5FTCk7Ci0KLQlpZiAoIWNsa19kYXRhKQotCQlyZXR1cm47
Ci0KLQlod3MgPSBjbGtfZGF0YS0+aHdzOwotCi0JZm9yIChpID0gMDsgaSA8IENNVV9NQVhfQ0xL
UzsgKytpKQotCQlod3NbaV0gPSBFUlJfUFRSKC1FTk9FTlQpOwotCi0JYmFzZSA9IG9mX2lvbWFw
KG5wLCAwKTsKLQlpZiAoIWJhc2UpIHsKLQkJcHJfd2FybigiRmFpbGVkIHRvIG1hcCBhZGRyZXNz
IHJhbmdlIGZvciBlZm0zMmdnLGNtdSBub2RlXG4iKTsKLQkJcmV0dXJuOwotCX0KLQotCWh3c1tj
bGtfSEZYT10gPSBjbGtfaHdfcmVnaXN0ZXJfZml4ZWRfcmF0ZShOVUxMLCAiSEZYTyIsIE5VTEws
IDAsCi0JCQkJCQkgICA0ODAwMDAwMCk7Ci0KLQlod3NbY2xrX0hGUEVSQ0xLVVNBUlQwXSA9IGNs
a19od19yZWdpc3Rlcl9nYXRlKE5VTEwsICJIRlBFUkNMSy5VU0FSVDAiLAotCQkJIkhGWE8iLCAw
LCBiYXNlICsgQ01VX0hGUEVSQ0xLRU4wLCAwLCAwLCBOVUxMKTsKLQlod3NbY2xrX0hGUEVSQ0xL
VVNBUlQxXSA9IGNsa19od19yZWdpc3Rlcl9nYXRlKE5VTEwsICJIRlBFUkNMSy5VU0FSVDEiLAot
CQkJIkhGWE8iLCAwLCBiYXNlICsgQ01VX0hGUEVSQ0xLRU4wLCAxLCAwLCBOVUxMKTsKLQlod3Nb
Y2xrX0hGUEVSQ0xLVVNBUlQyXSA9IGNsa19od19yZWdpc3Rlcl9nYXRlKE5VTEwsICJIRlBFUkNM
Sy5VU0FSVDIiLAotCQkJIkhGWE8iLCAwLCBiYXNlICsgQ01VX0hGUEVSQ0xLRU4wLCAyLCAwLCBO
VUxMKTsKLQlod3NbY2xrX0hGUEVSQ0xLVUFSVDBdID0gY2xrX2h3X3JlZ2lzdGVyX2dhdGUoTlVM
TCwgIkhGUEVSQ0xLLlVBUlQwIiwKLQkJCSJIRlhPIiwgMCwgYmFzZSArIENNVV9IRlBFUkNMS0VO
MCwgMywgMCwgTlVMTCk7Ci0JaHdzW2Nsa19IRlBFUkNMS1VBUlQxXSA9IGNsa19od19yZWdpc3Rl
cl9nYXRlKE5VTEwsICJIRlBFUkNMSy5VQVJUMSIsCi0JCQkiSEZYTyIsIDAsIGJhc2UgKyBDTVVf
SEZQRVJDTEtFTjAsIDQsIDAsIE5VTEwpOwotCWh3c1tjbGtfSEZQRVJDTEtUSU1FUjBdID0gY2xr
X2h3X3JlZ2lzdGVyX2dhdGUoTlVMTCwgIkhGUEVSQ0xLLlRJTUVSMCIsCi0JCQkiSEZYTyIsIDAs
IGJhc2UgKyBDTVVfSEZQRVJDTEtFTjAsIDUsIDAsIE5VTEwpOwotCWh3c1tjbGtfSEZQRVJDTEtU
SU1FUjFdID0gY2xrX2h3X3JlZ2lzdGVyX2dhdGUoTlVMTCwgIkhGUEVSQ0xLLlRJTUVSMSIsCi0J
CQkiSEZYTyIsIDAsIGJhc2UgKyBDTVVfSEZQRVJDTEtFTjAsIDYsIDAsIE5VTEwpOwotCWh3c1tj
bGtfSEZQRVJDTEtUSU1FUjJdID0gY2xrX2h3X3JlZ2lzdGVyX2dhdGUoTlVMTCwgIkhGUEVSQ0xL
LlRJTUVSMiIsCi0JCQkiSEZYTyIsIDAsIGJhc2UgKyBDTVVfSEZQRVJDTEtFTjAsIDcsIDAsIE5V
TEwpOwotCWh3c1tjbGtfSEZQRVJDTEtUSU1FUjNdID0gY2xrX2h3X3JlZ2lzdGVyX2dhdGUoTlVM
TCwgIkhGUEVSQ0xLLlRJTUVSMyIsCi0JCQkiSEZYTyIsIDAsIGJhc2UgKyBDTVVfSEZQRVJDTEtF
TjAsIDgsIDAsIE5VTEwpOwotCWh3c1tjbGtfSEZQRVJDTEtBQ01QMF0gPSBjbGtfaHdfcmVnaXN0
ZXJfZ2F0ZShOVUxMLCAiSEZQRVJDTEsuQUNNUDAiLAotCQkJIkhGWE8iLCAwLCBiYXNlICsgQ01V
X0hGUEVSQ0xLRU4wLCA5LCAwLCBOVUxMKTsKLQlod3NbY2xrX0hGUEVSQ0xLQUNNUDFdID0gY2xr
X2h3X3JlZ2lzdGVyX2dhdGUoTlVMTCwgIkhGUEVSQ0xLLkFDTVAxIiwKLQkJCSJIRlhPIiwgMCwg
YmFzZSArIENNVV9IRlBFUkNMS0VOMCwgMTAsIDAsIE5VTEwpOwotCWh3c1tjbGtfSEZQRVJDTEtJ
MkMwXSA9IGNsa19od19yZWdpc3Rlcl9nYXRlKE5VTEwsICJIRlBFUkNMSy5JMkMwIiwKLQkJCSJI
RlhPIiwgMCwgYmFzZSArIENNVV9IRlBFUkNMS0VOMCwgMTEsIDAsIE5VTEwpOwotCWh3c1tjbGtf
SEZQRVJDTEtJMkMxXSA9IGNsa19od19yZWdpc3Rlcl9nYXRlKE5VTEwsICJIRlBFUkNMSy5JMkMx
IiwKLQkJCSJIRlhPIiwgMCwgYmFzZSArIENNVV9IRlBFUkNMS0VOMCwgMTIsIDAsIE5VTEwpOwot
CWh3c1tjbGtfSEZQRVJDTEtHUElPXSA9IGNsa19od19yZWdpc3Rlcl9nYXRlKE5VTEwsICJIRlBF
UkNMSy5HUElPIiwKLQkJCSJIRlhPIiwgMCwgYmFzZSArIENNVV9IRlBFUkNMS0VOMCwgMTMsIDAs
IE5VTEwpOwotCWh3c1tjbGtfSEZQRVJDTEtWQ01QXSA9IGNsa19od19yZWdpc3Rlcl9nYXRlKE5V
TEwsICJIRlBFUkNMSy5WQ01QIiwKLQkJCSJIRlhPIiwgMCwgYmFzZSArIENNVV9IRlBFUkNMS0VO
MCwgMTQsIDAsIE5VTEwpOwotCWh3c1tjbGtfSEZQRVJDTEtQUlNdID0gY2xrX2h3X3JlZ2lzdGVy
X2dhdGUoTlVMTCwgIkhGUEVSQ0xLLlBSUyIsCi0JCQkiSEZYTyIsIDAsIGJhc2UgKyBDTVVfSEZQ
RVJDTEtFTjAsIDE1LCAwLCBOVUxMKTsKLQlod3NbY2xrX0hGUEVSQ0xLQURDMF0gPSBjbGtfaHdf
cmVnaXN0ZXJfZ2F0ZShOVUxMLCAiSEZQRVJDTEsuQURDMCIsCi0JCQkiSEZYTyIsIDAsIGJhc2Ug
KyBDTVVfSEZQRVJDTEtFTjAsIDE2LCAwLCBOVUxMKTsKLQlod3NbY2xrX0hGUEVSQ0xLREFDMF0g
PSBjbGtfaHdfcmVnaXN0ZXJfZ2F0ZShOVUxMLCAiSEZQRVJDTEsuREFDMCIsCi0JCQkiSEZYTyIs
IDAsIGJhc2UgKyBDTVVfSEZQRVJDTEtFTjAsIDE3LCAwLCBOVUxMKTsKLQotCW9mX2Nsa19hZGRf
aHdfcHJvdmlkZXIobnAsIG9mX2Nsa19od19vbmVjZWxsX2dldCwgY2xrX2RhdGEpOwotfQotQ0xL
X09GX0RFQ0xBUkUoZWZtMzJnZ2NtdSwgImVmbTMyZ2csY211IiwgZWZtMzJnZ19jbXVfaW5pdCk7
Ci0tIAoyLjI5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
