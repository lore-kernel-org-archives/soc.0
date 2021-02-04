Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8999EC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 12:03:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2807864F4D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 12:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2807864F4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XJoshqNfy2E0Gpa60S5CQGgT4dVE3uZqfuL8/L204+w=; b=Wfq/GlJSRxFM/owauHLrroLTQ
	Ev9oiAAgeSLaPm3EcvwNykMV/6gYsll+FPG7e0P8JVWS3TvildJymJTrZ+7dfmUDVPpWUaxAszH/C
	9gl6LSGokBqgLPDFnL+ySsDSuYe/uS5Aigsgba3GNlCD1th01GXlPkhWq2mzmClUGELW88VxY2jrE
	184AuPHUG/Jrz3zV6YaANH7XdAYxiZyl2tRHei7h4h6937qADovk/ul+O86y6F++51M/Q9o/rwmYM
	QymIfd9Bqi1kx4fOeXzVzU2gW9qOzP91zIIQcm33YPb0p6+945ZW1ox5jSytoTU6aLi267wM3z/Fw
	zVmaFkUWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7dL3-0006By-Bp; Thu, 04 Feb 2021 12:02:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7dKy-0006Aq-2w
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 12:02:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 691B164F67;
 Thu,  4 Feb 2021 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612440135;
 bh=alFmec2khP2pcPxznb6LXB9Sfq5jWl/sZ2JgCWLTFxw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zika4B+5G20lf13jJvRRp8LM0o/SHjVRJYLXXB/bIJNbzoSLFG0TCnwb2erY8da32
 U7ZXFAhTqhIDN4n9J1nehLaJkSCkhtw8f+/vUbe2SkP2NZrshK+UCHOi0fnONi/uo4
 vNKW2v38H1bZTBKtMOiE20rHzoiyXJVlOpiQyt2nog0DIFs4TnhWu6Qp3E7PFMW39z
 k7z6kAm43Jdscrv/G1bw1NTOzflFMtyEXCeMegHAybI+kb3JRftIMKdpoo5t5zqzaU
 xgLOohTUGTEiMMrF+3uZ+AwlTjxRrMWFXYTD7JILkJo4/cBu2Dm4zwCQDo/wMEsVpA
 wNQfYSCp7OFcA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Subject: [GIT PULL 6/6] i.MX defconfig update for 5.12
Date: Thu,  4 Feb 2021 20:01:50 +0800
Message-ID: <20210204120150.26186-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204120150.26186-1-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_070216_270586_65A9B5F8 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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
Cc: Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204120150.TjriwEVSe1zRLgG-AX0fIksggS2YJ8m3OM-8b5sxtPM@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1YzhmZTU4M2NjZTU0MmFhMGI4NGFk
YzkzOWNlODUyOTNkZTM2ZTVlOgoKICBMaW51eCA1LjExLXJjMSAoMjAyMC0xMi0yNyAxNTozMDoy
MiAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc2hhd25ndW8vbGludXgu
Z2l0IHRhZ3MvaW14LWRlZmNvbmZpZy01LjEyCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gZDk4NGQxYTBhYmY4N2Q4OTAyNTBkZmE2MzNjMGFlM2M2MjVkZTllOToKCiAgYXJtNjQ6IGRl
ZmNvbmZpZzogRW5hYmxlIFBGOHgwMCBhcyBidWlsdGluICgyMDIxLTAxLTMwIDIyOjMxOjI0ICsw
ODAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQppLk1YIGRlZmNvbmZpZyBjaGFuZ2UgZm9yIDUuMTI6CgotIEVuYWJsZSBX
TTg5NjIgc3VwcG9ydCBuZWVkZWQgYnkgaW14OG1uLWJlYWNvbi1raXQuCi0gRW5hYmxlIFBGOHgw
MCBzdXBwb3J0IHVzZWQgYnkgQm91bmRhcnkgTml0cm9nZW44TSBNaW5pIFNCQy4KLSBFbmFibGUg
YSBmZXcgZHJpdmVycyBmb3IgTGlicmVtIDUgZGV2a2l0IHN1cHBvcnQuCi0gRW5hYmxlIGludGVy
Y29ubmVjdCBzdXBwb3J0IGZvciBpLk1YOE1RLgotIEVuYWJsZSBCcm9hZGNvbSBCQ001NDE0MCBQ
SFkgZHJpdmVyIGZvciBLb250cm9uIEstQm94IEEtMjMwLUxTLgotIEVuYWJsZSBSVjMwMjggSTJD
IFJUQyBhbmQgUENBOTUzMiBkcml2ZXIgc3VwcG9ydCBmb3IgcGh5Qk9BUkQtUG9sbHV4CiAgaS5N
WDhNUC4KLSBFbmFibGUgUk41VDYxOCBQTUlDIGRyaXZlciBzdXBwb3J0IGluIGlteF92Nl92N19k
ZWZjb25maWcuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCkFkYW0gRm9yZCAoMSk6CiAgICAgIGFybTY0OiBkZWZjb25maWc6
IEVuYWJsZSBXTTg5NjIKCkFkcmllbiBHcmFzc2VpbiAoMSk6CiAgICAgIGFybTY0OiBkZWZjb25m
aWc6IEVuYWJsZSBQRjh4MDAgYXMgYnVpbHRpbgoKQW5kcmVhcyBLZW1uYWRlICgxKToKICAgICAg
QVJNOiBpbXhfdjZfdjdfZGVmY29uZmlnOiBlbmFibGUgcG93ZXIgZHJpdmVyIG9mIFJONVQ2MTgg
UE1JQyBmYW1pbHkKCkd1aWRvIEfDvG50aGVyICgyKToKICAgICAgYXJtNjQ6IGRlZmNvbmZpZzog
RW5hYmxlIExpYnJlbSA1IGRldmtpdCBjb21wb25lbnRzCiAgICAgIGFybTY0OiBkZWZjb25maWc6
IEVuYWJsZSB2aWJyYS1wd20KCk1hcnRpbiBLZXBwbGluZ2VyICgxKToKICAgICAgYXJtNjQ6IGRl
ZmNvbmZpZzogRW5hYmxlIGludGVyY29ubmVjdCBmb3IgaW14OG1xCgpNaWNoYWVsIFdhbGxlICgx
KToKICAgICAgYXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxlIEJyb2FkY29tIEJDTTU0MTQwIFBIWQoK
VGVyZXNhIFJlbW1ldCAoMik6CiAgICAgIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBydjMwMjgg
aTJjIHJ0YyBkcml2ZXIKICAgICAgYXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxlIFBDQTk1MzIgc3Vw
cG9ydAoKIGFyY2gvYXJtL2NvbmZpZ3MvaW14X3Y2X3Y3X2RlZmNvbmZpZyB8ICAxICsKIGFyY2gv
YXJtNjQvY29uZmlncy9kZWZjb25maWcgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAps
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
