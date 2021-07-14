Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725AAC07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 16:59:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40E7861360
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 16:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40E7861360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s29/DH9nvv3Fi3JbRp9Bg4/ueK4zk8+X/IQDcpZDNpo=; b=QspCW/nmORSH4x
	uhGmY2iT/nXtQPlkOqWaUHtWcQe+/FMgpKs0BRnjTaidT9DBlZt7uR+yiWWIcghQSN4FrmyCldx7q
	TL0qZ5W14iT0Uv93cLcrSCkQjxJQq9XwhU28deKAN1pZKHs93m9xmjFIPhbvCcqXqB4s8oWWsr4mt
	Hg0XnDJNOLaCxYTl7qm2f2+ZY7/VErbsKN/JykD7csd1zJDYYsRZ6KtXIanNWL86nLunyKGW/xr1n
	OuC8sATuz6hL1zNB0iHwTTe94p7L9kl+Ab3g7zFXoPiKKuJ1NqQE7N+ogqbXk18RYeJo4MRGFx8f3
	rRsovL+2fNFGN93RBLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3iDA-00ECY3-Mu; Wed, 14 Jul 2021 16:58:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3iD5-00ECWq-Fo
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 16:58:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C216D6E;
 Wed, 14 Jul 2021 09:58:10 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 44FAD3F774;
 Wed, 14 Jul 2021 09:58:09 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>,
 Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: fixes for v5.14
Date: Wed, 14 Jul 2021 17:58:06 +0100
Message-ID: <20210714165806.2617325-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_095811_616837_286FA93F 
X-CRM114-Status: UNSURE (   8.73  )
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
Message-ID: <20210714165806.pNohCL5GzT4pHO81bxvAVSpB2LVOFlLKo8o-c5P30pI@z>

SGkgQVJNIFNvQyBUZWFtLAoKUGxlYXNlIHB1bGwgIQoKUmVnYXJkcywKU3VkZWVwCgotLT44CgpU
aGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGU3M2YwZjBlZTc1NDExNzFkODlmMmUy
NDkxMTMwYzc3NzFiYTU4ZDM6CgogIExpbnV4IDUuMTQtcmMxICgyMDIxLTA3LTExIDE1OjA3OjQw
IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdWRlZXAuaG9sbGEvbGlu
dXguZ2l0IHRhZ3MvYXJtLWZmYS1maXhlcy01LjE0Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gZGQ5MjVkYjZmMDc1NTYwNjFjMTFhYjFmYmZhNGEwMTQ1YWU2YjQzODoKCiAgZmlybXdh
cmU6IGFybV9mZmE6IEZpeCBhIHBvc3NpYmxlIGZmYV9saW51eF9lcnJtYXAgYnVmZmVyIG92ZXJm
bG93ICgyMDIxLTA3LTEyIDE0OjIwOjA4ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBcm0gRkYtQSBmaXhlcyBm
b3IgdjUuMTQKCkEgc21hbGwgc2V0IG9mIGZpeGVzOgotIGFkZGluZyBjaGVjayBmb3IgcHJlc2Vu
Y2Ugb2YgcHJvYmUgd2hpbGUgcmVnaXN0ZXJpbmcgdGhlIGRyaXZlciB0bwogIHByZXZlbnQgTlVM
TCBwb2ludGVyIGFjY2VzcwotIGRyb3BwaW5nIHRoZSBkdXBsaWNhdGUgY2hlY2sgYXMgdGhlIGRy
aXZlciBjb3JlIGFscmVhZHkgdGFrZXMgY2FyZSBvZiBpdAotIGZpeGluZyBwb3NzaWJsZSBmZmFf
bGludXhfZXJybWFwIGJ1ZmZlciBvdmVyZmxvdyBhbmQKLSBmaXhpbmcga2VybmVsLWRvYyB3YXJu
aW5nIGZvciBjb21tZW50IHN0eWxlCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClN1ZGVlcCBIb2xsYSAoMik6CiAgICAgIGZp
cm13YXJlOiBhcm1fZmZhOiBGaXggdGhlIGNvbW1lbnQgc3R5bGUKICAgICAgZmlybXdhcmU6IGFy
bV9mZmE6IEZpeCBhIHBvc3NpYmxlIGZmYV9saW51eF9lcnJtYXAgYnVmZmVyIG92ZXJmbG93CgpV
d2UgS2xlaW5lLUvDtm5pZyAoMik6CiAgICAgIGZpcm13YXJlOiBhcm1fZmZhOiBFbnN1cmUgZHJp
dmVycyBwcm92aWRlIGEgcHJvYmUgZnVuY3Rpb24KICAgICAgZmlybXdhcmU6IGFybV9mZmE6IFNp
bXBsaWZ5IHByb2JlIGZ1bmN0aW9uCgogZHJpdmVycy9maXJtd2FyZS9hcm1fZmZhL2J1cy5jICAg
IHwgNiArKystLS0KIGRyaXZlcnMvZmlybXdhcmUvYXJtX2ZmYS9kcml2ZXIuYyB8IDggKysrKyst
LS0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=
