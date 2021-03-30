Return-Path: <SRS0=+/G9=I4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D74C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Mar 2021 18:42:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9114619DD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Mar 2021 18:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9114619DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=duH6onuP8mHHDNtoX65KywZiO5bi5xDWA56X5aKtG00=; b=SkOxij0lAKHbCgOV8eZGwKLSX
	MGuBUUdDwE50vf8yNzaYjb+lqQWTJYfRDom9q7TRp+KlzqWX161SI+ObNltmPJIYrr2GH9w4DgvHZ
	V4B76Ma9/vtqisEp2ZnT13oeFOBo6KvnkNYWdb8/m7mpP8ccVjyjOYDllSuUNuWghOOE/AUhgybkV
	ymfq17c1BkTPMsgrVVLhNhZ0HHkVry6ApoGtU3x98UY1et7gmYE0m4D+q9l5dLedbm/yNEUrFwy1z
	cPOERUElGcNktzLsSvaVyvsB+EluIlGLAGacftHNk+vyjipNgaHjGyKx1tIjY8uqgw/6OzKvvR0tq
	ZC8DfOShA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRJI0-004eC7-0S; Tue, 30 Mar 2021 18:40:32 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRJHj-004e9E-FP
 for linux-arm-kernel@lists.infradead.org; Tue, 30 Mar 2021 18:40:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id f17so6617311plr.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 30 Mar 2021 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H3Xg6pVdKFcLHkDnuynv+KrzACQdL7Z+QfspHhlmM7o=;
 b=t0IZ1UcOUonTShG95R7idEdFtvN6FmBLIOe6k8Jlsg3HkuHiY6smRWgd5uiou1rlOq
 kypxQMKkcTuS7w4fRID25BEDKryOLfYEmUFjGo2oJVvhENCCPdCzEIxhbDQGnRvj2yq5
 t75uwNsacilOe/AKuXMIgX1KrkUzx9XMWN7dW49lFE9GJhPhfU/VRTgDtgtioOkbWtW5
 I0H7a3JMPyTKXRXG46u5Cpgb3c3YjiWqlQLqPUxdIE9gZjdKh7RZEGeTPR7GY4Z7PhoW
 cNsm2H/8KEkQZajPst5re/lk6ViRe8RTC+/8YT8tjAiBFZMdZ7W2UyUzjSLMTzejHw2o
 JwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H3Xg6pVdKFcLHkDnuynv+KrzACQdL7Z+QfspHhlmM7o=;
 b=b5EH1gKDAafSUvxSF2135NPvwhjpqBXMsR6ZByeV+xQzSNIqcfIFvcjN6ZMOHW3Afb
 N1unTwrEfG5inYTEEESfA1TNdZwU0AegVoQD/Kd4QUzS04y1DVnPFhQZhWJfjHsAhRnZ
 i+mW7DDEIUsn65kNxNGHJWL8irWYtuH55+8Mrbji7l7BfzGbGVEsKtH0lBp4jvjNf4vm
 udi1S1wujkOaQjNg2Thr2C2cVkw3gKKXgx7sMqP2EpvVZWBNnBJs1CpRaCNeXkqO16Ua
 GkELWRM+gNJmcB254RBoZolmT7wuAZilYYDmqP7BnpqhsZ2mZ6765B7zdsrKhd3S8xL3
 O4Yw==
X-Gm-Message-State: AOAM533oklt2s1aEY+7YUCF5jUSRIZ3h5rd2ZPTKUO5EwYUeWi253ddU
 grehnoSgdFKb8um96FSzHAY=
X-Google-Smtp-Source: ABdhPJyokzrIZazmQ0BY78LLblAdzpZhyC/+dZc80/RYigA2kXH+fmyaB+L9azwZo22SIz3pEZF4hA==
X-Received: by 2002:a17:90a:8b97:: with SMTP id z23mr662960pjn.1.1617129613930; 
 Tue, 30 Mar 2021 11:40:13 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id gm9sm3307696pjb.13.2021.03.30.11.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 11:40:13 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.13
Date: Tue, 30 Mar 2021 11:40:05 -0700
Message-ID: <20210330184006.1451315-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330184006.1451315-1-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_194015_569329_E949CF35 
X-CRM114-Status: GOOD (  11.04  )
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
Message-ID: <20210330184005.p3l3FroMEAzMRUv3lUNtjY7qT1xuSte-K1IXp0NfpYg@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBmZTA3YmZkYTJmYjljZGVmOGE0ZDQw
MDhhNDA5YmIwMmYzNWYxYmQ4OgoKICBMaW51eCA1LjEyLXJjMSAoMjAyMS0wMi0yOCAxNjowNTox
OSAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdGh1Yi5jb20vQnJvYWRjb20vc3RibGludXguZ2l0IHRhZ3MvYXJtLXNvYy9mb3ItNS4x
My9kZXZpY2V0cmUtYXJtNjQKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA5ZjAxZjVj
ZGI1NDgzNTI0MThiMzRjZTc3ZGIwMmE1NjBmZTI5MTNiOgoKICBhcm02NDogZHRzOiBicm9hZGNv
bTogYmNtNDkwODogYWRkIEV0aGVybmV0IE1BQyBhZGRyICgyMDIxLTAzLTI5IDExOjQ0OjMxIC0w
NzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpUaGlzIHB1bGwgcmVxdWVzdCBjb250YWlucyBCcm9hZGNvbSBBUk02NC1i
YXNlZCBTb0NzIERldmljZSBUcmVlIGNoYW5nZXMKZm9yIDUuMTMsIHBsZWFzZSBwdWxsIHRoZSBm
b2xsb3dpbmc6CgotIFJhZmFsIGNvbnRpbnVlcyB0byBhZGQgc3VwcG9ydCBmb3IgdGhlIDQ5MDgg
U29DcyBhbmQgZGVzY3JpYmVzIHRoZSBVU0IKICBQSFksIGZpcm13YXJlIGZsYXNoIHBhcnRpdGlv
bnMgYW5kIEV0aGVybmV0IHN3aXRjaCBhbmQgRXRoZXJuZXQKICBjb250cm9sbGVyLiBIZSBhbHNv
IGFkZHMgc3VwcG9ydCBmb3IgdGhlIFRQLUxpbmsgQXJjaGVyIEMyMzAwIFYxCiAgcm91dGVyIGFu
ZCB1cGF0ZXMgdGhlIE5ldGdlYXIgUjgwMDBQIGFuZCBBc3VzIEdULUFDNTMwMCByb3V0ZXJzIG5l
dHdvcmsKICBwb3J0cyBkZXNjcmlwdGlvbi4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUmFmYcWCIE1pxYJlY2tpICgxMSk6
CiAgICAgIGFybTY0OiBkdHM6IGJyb2FkY29tOiBiY200OTA4OiBkZXNjcmliZSBVU0IgUEhZCiAg
ICAgIGFybTY0OiBkdHM6IGJyb2FkY29tOiBiY200OTA4OiBkZXNjcmliZSBFdGhlcm5ldCBjb250
cm9sbGVyCiAgICAgIGFybTY0OiBkdHM6IGJyb2FkY29tOiBiY200OTA4OiBkZXNjcmliZSBOZXRn
ZWFyIFI4MDAwUCBzd2l0Y2gKICAgICAgYXJtNjQ6IGR0czogYnJvYWRjb206IGJjbTQ5MDg6IGFk
ZCByZW1haW5pbmcgTmV0Z2VhciBSODAwMFAgTEVEcwogICAgICBhcm02NDogZHRzOiBicm9hZGNv
bTogYmNtNDkwODogZGVzY3JpYmUgZmlybXdhcmUgcGFydGl0aW9ucwogICAgICBhcm02NDogZHRz
OiBicm9hZGNvbTogYmNtNDkwODogZml4IHN3aXRjaCBwYXJlbnQgbm9kZSBuYW1lCiAgICAgIGR0
LWJpbmRpbmdzOiBhcm06IGJjbTogZG9jdW1lbnQgVFAtTGluayBBcmNoZXIgQzIzMDAgYmluZGlu
ZwogICAgICBhcm02NDogZHRzOiBicm9hZGNvbTogYmNtNDkwODogYWRkIFRQLUxpbmsgQXJjaGVy
IEMyMzAwIFYxCiAgICAgIGFybTY0OiBkdHM6IGJyb2FkY29tOiBiY200OTA4OiBzZXQgQXN1cyBH
VC1BQzUzMDAgcG9ydCA3IFBIWSBtb2RlCiAgICAgIGFybTY0OiBkdHM6IGJyb2FkY29tOiBiY200
OTA4OiBhZGQgRXRoZXJuZXQgVFggaXJxCiAgICAgIGFybTY0OiBkdHM6IGJyb2FkY29tOiBiY200
OTA4OiBhZGQgRXRoZXJuZXQgTUFDIGFkZHIKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
YmNtL2JyY20sYmNtNDkwOC55YW1sICB8ICAgMSArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2Jyb2Fk
Y29tL2JjbTQ5MDgvTWFrZWZpbGUgICAgICB8ICAgMSArCiAuLi4vYnJvYWRjb20vYmNtNDkwOC9i
Y200OTA2LW5ldGdlYXItcjgwMDBwLmR0cyAgICB8IDEwNyArKysrKysrKysrKy0KIC4uLi9iY200
OTA4L2JjbTQ5MDYtdHBsaW5rLWFyY2hlci1jMjMwMC12MS5kdHMgICAgIHwgMTgyICsrKysrKysr
KysrKysrKysrKysrKwogLi4uL2Jyb2FkY29tL2JjbTQ5MDgvYmNtNDkwOC1hc3VzLWd0LWFjNTMw
MC5kdHMgICAgfCAgNDQgKysrKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYnJvYWRjb20vYmNtNDkw
OC9iY200OTA4LmR0c2kgIHwgIDQ3ICsrKysrLQogNiBmaWxlcyBjaGFuZ2VkLCAzNzUgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jv
b3QvZHRzL2Jyb2FkY29tL2JjbTQ5MDgvYmNtNDkwNi10cGxpbmstYXJjaGVyLWMyMzAwLXYxLmR0
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=
