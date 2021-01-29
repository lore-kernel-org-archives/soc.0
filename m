Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F9AC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 15:32:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7031C64E02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 15:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7031C64E02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AZdSLQqSMZzBeeipQB+GV0o8gUxuHEjzcyRNKZbNR8A=; b=Mp0ib/Ttboxigr9RxHptVy+gWq
	L9FP+Ezd5StWouYZ6inbK8ZYY9WgOnn4YIpgREy0NBnXZiUWvgmgBpl+TwKdggC47Fsnvb0LZLI4C
	JeViV3EZOW5u9bun+fWEeV1XT89MPr+X17Z96SBnU1nGH5Cy0LO6Gf/XDiqGHIsCuZeSiX3WxAnti
	SzO4yGr6XDmAWYWm5KuKZZ6DprTahS9mq7Vxk0dKdxk1U0jwvKYfYR+2rRLJbIUNviyfP9ZB/Lh1r
	dKlcGSoWrdIXBMLeT/3y8KO9LNZ+twPssj77y3rLjYEadme62n3g9sAKm6tMdPlAh+KbcrTda4r8m
	+96Rd8vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Vjx-0005CN-PO; Fri, 29 Jan 2021 15:31:17 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Vjv-0005Bd-QL
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 15:31:16 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1l5Vjq-0006IM-B9; Fri, 29 Jan 2021 16:31:10 +0100
Received: from pza by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1l5Vjo-0007NS-0w; Fri, 29 Jan 2021 16:31:08 +0100
Date: Fri, 29 Jan 2021 16:31:08 +0100
From: Philipp Zabel <pza@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] Reset controller updates for v5.12
Message-ID: <20210129153108.GA26994@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:28:07 up 58 days,  3:44, 96 users,  load average: 12.71, 13.74,
 12.90
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_103115_890589_A942626E 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210129153108.9jzwkGu4aGfjFiBEZ3azL3yHkdKQkYBl1yMPSA80f5M@z>

RGVhciBhcm0tc29jIG1haW50YWluZXJzLAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCA1YzhmZTU4M2NjZTU0MmFhMGI4NGFkYzkzOWNlODUyOTNkZTM2ZTVlOgoKICBMaW51eCA1
LjExLXJjMSAoMjAyMC0xMi0yNyAxNTozMDoyMiAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQucGVuZ3V0cm9uaXguZGUvcHphL2xpbnV4
LmdpdCB0YWdzL3Jlc2V0LWZvci12NS4xMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IGQxNzY1NTc1OWIzZmM2NjBlYTQ5YmQ3YmU2NjVjMTkzMDMwYzc3YzA6CgogIHJlc2V0OiBBZGQg
ZGV2bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmVfcmVsZWFzZWQoKSAoMjAy
MS0wMS0yNSAxNzozMjoxMCArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUmVzZXQgY29udHJvbGxlciB1cGRhdGVz
IGZvciB2NS4xMgoKVGhpcyB0YWcgYWRkcyBzdXBwb3J0IGZvciBCcm9hZGNvbSBCQ000OTA4IFBD
SWUgcmVzZXRzLCBjb3JyZWN0cwp0aGUgSGlzaWxpY29uIHZlbmRvciBwcmVmaXgsIGFkZHMgYSBt
aXNzaW5nIEFQSSBmdW5jdGlvbgpkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1
c2l2ZV9yZWxlYXNlZCgpLCBhbmQgZml4ZXMKdGhlIGtlcm5lbC1kb2MgbWFya3VwIGZvciB0aGUg
X19kZXZpY2VfcmVzZXQoKSBmdW5jdGlvbi4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRG1pdHJ5IE9zaXBlbmtvICgxKToK
ICAgICAgcmVzZXQ6IEFkZCBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2
ZV9yZWxlYXNlZCgpCgpNYXVybyBDYXJ2YWxobyBDaGVoYWIgKDEpOgogICAgICByZXNldDogY29y
ZTogZml4IGEga2VybmVsLWRvYyBtYXJrdXAKClJhZmHFgiBNacWCZWNraSAoMik6CiAgICAgIGR0
LWJpbmRpbmdzOiByZXNldDogZG9jdW1lbnQgQnJvYWRjb20ncyBCQ000OTA4IFBDSWUgcmVzZXQg
YmluZGluZwogICAgICByZXNldDogc2ltcGxlOiBhZGQgQkNNNDkwOCBNSVNDIFBDSWUgcmVzZXQg
Y29udHJvbGxlciBzdXBwb3J0CgpaaGVuIExlaSAoMyk6CiAgICAgIHJlc2V0OiBoaXNpbGljb246
IGNvcnJlY3QgdmVuZG9yIHByZWZpeAogICAgICBkdC1iaW5kaW5nczogcmVzZXQ6IGNvcnJlY3Qg
dmVuZG9yIHByZWZpeCBoaXNpIHRvIGhpc2lsaWNvbgogICAgICBkdC1iaW5kaW5nczogcmVzZXQ6
IGNvbnZlcnQgSGlzaWxpY29uIHJlc2V0IGNvbnRyb2xsZXIgYmluZGluZ3MgdG8ganNvbi1zY2hl
bWEKCiAuLi4vcmVzZXQvYnJjbSxiY200OTA4LW1pc2MtcGNpZS1yZXNldC55YW1sICAgICAgICB8
IDM5ICsrKysrKysrKysrCiAuLi4vYmluZGluZ3MvcmVzZXQvaGlzaWxpY29uLGhpMzY2MC1yZXNl
dC50eHQgICAgICB8IDQ0IC0tLS0tLS0tLS0tLS0KIC4uLi9iaW5kaW5ncy9yZXNldC9oaXNpbGlj
b24saGkzNjYwLXJlc2V0LnlhbWwgICAgIHwgNzcgKysrKysrKysrKysrKysrKysrKysrKwogZHJp
dmVycy9yZXNldC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQog
ZHJpdmVycy9yZXNldC9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCAr
LQogZHJpdmVycy9yZXNldC9oaXNpbGljb24vcmVzZXQtaGkzNjYwLmMgICAgICAgICAgICAgfCAg
OSArKy0KIGRyaXZlcnMvcmVzZXQvcmVzZXQtc2ltcGxlLmMgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKwogaW5jbHVkZS9saW51eC9yZXNldC5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxOSArKysrKysKIDggZmlsZXMgY2hhbmdlZCwgMTQ3IGluc2VydGlvbnMoKyksIDQ5IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yZXNldC9icmNtLGJjbTQ5MDgtbWlzYy1wY2llLXJlc2V0LnlhbWwKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvaGlzaWxp
Y29uLGhpMzY2MC1yZXNldC50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmVzZXQvaGlzaWxpY29uLGhpMzY2MC1yZXNldC55YW1sCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2Vy
bmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVs
Cg==
