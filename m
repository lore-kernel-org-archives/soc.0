Return-Path: <SRS0=Uu9Z=I7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C540FC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 21:07:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C4D261158
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 21:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C4D261158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vj3coNB5seDhmEtg2W5pwds04JSErHixaTBRjHo0hCE=; b=drBnirPKB/SGE6EOZlUcCct9Fu
	kq3T+fSAW2pfXCtJKqznBV5G/qqH5HdumRg+bYxW/EZ06Q7Kc2xA8W2IGg1vZ/36Szpfxp1VLRaCK
	TegrDWRbv0JHZBwBBnupS2XUZ+Tt7PRJNMLJdjjVMSI/lxOYBixxOt3PX43AFMhU60ZAhvX8BIxjI
	/xP3iAlidqIKb0LCiJtuXwCQm5u3huc3OmofaoGxn+AT4sokrO9qZTOGk0pERRwNtUPro4ecWTHT0
	huDp83XcZAyDOw0vQl6888frMGUIE3pSZYnl7jQ8MxVB06Xhl2NKIREdgRwEb2iG4gRZvt1L+L2nw
	m1Z2i8qw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSQzE-00Dq5u-90; Fri, 02 Apr 2021 21:05:48 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSQz9-00Dq5S-CW
 for linux-arm-kernel@lists.infradead.org; Fri, 02 Apr 2021 21:05:45 +0000
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
 (Authenticated sender: gregory.clement@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6A3E1200004;
 Fri,  2 Apr 2021 21:05:42 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.13 (#1)
Date: Fri, 02 Apr 2021 23:05:42 +0200
Message-ID: <874kgocs7t.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_220543_501813_94DA4433 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210402210542.wZRhntdTiE3t9oo2tjE_q-P_bZ0HVN7BtJEFR8taK4k@z>

SGksCgpIZXJlIGlzIHRoZSBmaXJzdCBwdWxsIHJlcXVlc3QgZm9yIGR0NjQgZm9yIG12ZWJ1IGZv
ciB2NS4xMy4KCkdyZWdvcnkKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYTM4
ZmQ4NzQ4NDY0ODMxNTg0YTE5NDM4Y2JiMzA4MmI1YTJkYWIxNToKCiAgTGludXggNS4xMi1yYzIg
KDIwMjEtMDMtMDUgMTc6MzM6NDEgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2djbGVtZW50L212ZWJ1LmdpdCB0YWdzL212ZWJ1LWR0NjQtNS4xMy0xCgpmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8gOTlmYThhYzVjMGYxY2Y3ODExOTRkYmQwNGZjZDE2MmY0Mzky
YTliMToKCiAgYXJtNjQ6IGR0czogbWFydmVsbDogZW5hYmxlIENQMTEwIFVUTUkgUEhZIHVzYWdl
ICgyMDIxLTA0LTAyIDIyOjQzOjUxICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQptdmVidSBkdDY0IGZvciA1LjEz
IChwYXJ0IDEpCgpBZGQgRFQgZm9yIGZhbiBjb250cm9sIG9uIFNvbGlkUnVuIENsZWFyZm9nIEdU
OGsgcGxhdGZvcm0KCkFkZCBzeXNjb24gY29tcGF0aWJsZSB0byBOQiBjbGsgbm9kZSBhbGxvd2lu
ZyBpbXByb3ZpbmcgY3B1ZnJlcQpzdXBwb3J0IG9uIEFybWFkYSAzN3h4CgpBZGQgc3VwcG9ydCBm
b3IgVVRNSSBQSFkgYWxsb3dpbmcgcmVtb3Zpbmcga2VybmVsIGRlcGVuZGVuY3kgZnJvbSB0aGUK
Ym9vdCBsb2FkZXIgZm9yIFVCUyBwb3J0IGNvbm5lY3RlZCB0byB0aGlzIFBIWSAoQXJtYWRhIDdL
LCA4SyBhbmQKQ045MXh4KQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpLb25zdGFudGluIFBvcm90Y2hraW4gKDIpOgogICAg
ICBhcm02NDogZHRzOiBtYXJ2ZWxsOiBhZGQgc3VwcG9ydCBmb3IgTWFydmVsbCBDUDExMCBVVE1J
IFBIWQogICAgICBhcm02NDogZHRzOiBtYXJ2ZWxsOiBlbmFibGUgQ1AxMTAgVVRNSSBQSFkgdXNh
Z2UKCk1hcmVrIEJlaMO6biAoMSk6CiAgICAgIGFybTY0OiBkdHM6IG1hcnZlbGw6IGFybWFkYS0z
N3h4OiBhZGQgc3lzY29uIGNvbXBhdGlibGUgdG8gTkIgY2xrIG5vZGUKClJ1c3NlbGwgS2luZyAo
Mik6CiAgICAgIGFybTY0OiBkdHM6IG1hcnZlbGw6IGNsZWFyZm9nLWd0LThrOiBhZGQgcHdtLWZh
bgogICAgICBhcm02NDogZHRzOiBtYXJ2ZWxsOiBjbGVhcmZvZy1ndC04azogYWRkIGNvb2xpbmcg
bWFwcwoKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtMzd4eC5kdHNpICAgICAg
IHwgICAzICstCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvYXJtYWRhLTcwNDAtZGIuZHRz
ICAgICB8ICAxNCArKy0KIC4uLi9kdHMvbWFydmVsbC9hcm1hZGEtODA0MC1jbGVhcmZvZy1ndC04
ay5kdHMgICAgIHwgMTI3ICsrKysrKysrKysrKysrKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0
cy9tYXJ2ZWxsL2FybWFkYS04MDQwLWRiLmR0cyAgICAgfCAgMjEgKysrLQogYXJjaC9hcm02NC9i
b290L2R0cy9tYXJ2ZWxsL2FybWFkYS04MDQwLW1jYmluLmR0c2kgfCAgMTkgKystCiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL21hcnZlbGwvYXJtYWRhLWNwMTF4LmR0c2kgICAgICB8ICAxOSArKysKIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9jbjkxMzAtZGIuZHRzICAgICAgICAgIHwgIDEyICst
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvY245MTMxLWRiLmR0cyAgICAgICAgICB8ICAg
OSArLQogYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2NuOTEzMi1kYi5kdHMgICAgICAgICAg
fCAgMTEgKy0KIDkgZmlsZXMgY2hhbmdlZCwgMjIwIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9u
cygtKQoKLS0gCkdyZWdvcnkgQ2xlbWVudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nCmh0dHA6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
