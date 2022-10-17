Return-Path: <SRS0=tBHE=2S=delyorkcreative.academy=noreply@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC0DC4332F
	for <soc@archiver.kernel.org>; Mon, 17 Oct 2022 14:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A24FAC433C1; Mon, 17 Oct 2022 14:21:18 +0000 (UTC)
Received: from delyorkcreative.delyorkcreative.academy (delyorkcreative.delyorkcreative.academy [142.93.37.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69B93C433D6
	for <soc@kernel.org>; Mon, 17 Oct 2022 14:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69B93C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=delyorkcreative.academy
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=delyorkcreative.academy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=delyorkcreative.academy; s=default; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VbY1N8QhrAu10QIOdVCfx4mYiA0Z4YsEBhD7o7iXX9A=; b=X/y30MQNCxFHcL7jA/hGnb6Lu+
	FiIbWjjQNPrbGZBEVqYrhnLEVmVixLqQa9sLpiXnOgF9oRsbpBcRcaDP6tB/df8XCs+CbXRr7EhI/
	lC6OM/LJa69c+Owj45oZATaRqYTTp1WHyj/GgDIJzJy9MK777BHhnv3y4U73vMOe1rE3C3dXAID5H
	niEVWukUqeXFZxEBgYChDX3m7xmhU4oKmRmZ+PsA7iiaotiYctuRirMvcV4vZM+W0bkP9ablh9JZu
	gRxDhKi/8klXNAFdrl+X6dGZiECdlonf9mwdWDHcexHDpPHBvE39MjHvZvs6v8l5l7LHzcEyQarc9
	TaIwIjpg==;
Received: from [20.171.64.74] (port=52782 helo=bs13103)
	by delyorkcreative.delyorkcreative.academy with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <noreply@delyorkcreative.academy>)
	id 1okQzS-0001lH-Ig
	for soc@kernel.org;
	Mon, 17 Oct 2022 14:21:14 +0000
thread-index: AdjiM7XH0AxGXg1VSCCN1xVBHNxKYQ==
Thread-Topic: Request processed as per telephonic approval
From: "=?utf-8?Q??=" <noreply@delyorkcreative.academy>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>
Subject: Request processed as per telephonic approval
Date: Mon, 17 Oct 2022 14:21:12 -0000
Message-ID: <713C431E388548EC996D327C3D556FAF@bs13103>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_39318_01D8E233.B5C75A60"
X-Mailer: Microsoft CDO for Windows 2000
Content-Class: urn:content-classes:message
Importance: normal
Priority: normal
X-MimeOLE: Produced By Microsoft MimeOLE
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - delyorkcreative.delyorkcreative.academy
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - delyorkcreative.academy
X-Get-Message-Sender-Via: delyorkcreative.delyorkcreative.academy: authenticated_id: noreply@delyorkcreative.academy
X-Authenticated-Sender: delyorkcreative.delyorkcreative.academy: noreply@delyorkcreative.academy
X-Source: 
X-Source-Args: 
X-Source-Dir: 

This is a multi-part message in MIME format.

------=_NextPart_000_39318_01D8E233.B5C75A60
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64


------=_NextPart_000_39318_01D8E233.B5C75A60
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PFA+RGVhciBzb2NAa2VybmVsLm9yZyw8L1A+DQo8UD5JdCB3YXMgZ3JlYXQgY2hhdHRpbmcgd2l0
aCB5b3UgeWVzdGVyZGF5IGFib3V0IHlvdXIgbmV3IHB1cmNoYXNlLjwvUD4NCjxQPkludm9pY2Ug
bm8tIEdLNzc4Mjc1OTcgLjwvUD4NCjxQPkFzIGRpc2N1c3NlZCBkdXJpbmcgdGhlIGNhbGwsIHdl
IGhhdmUgcHJvY2Vzc2VkIHRoZSBwYXltZW50Jm5ic3A7IGFuZCBhcyByZXF1ZXN0ZWQsIHdlIHdp
bGwgc2VuZCB0aGUgcmVjZWlwdCB0byB5b3VyIHJlZ2lzdGVyZWQgYmlsbGluZyBhZGRyZXNzLiBG
ZWVsIGZyZWUgdG8gY2FsbCB1cyBmb3IgYW55IGFzc2lzdGFuY2U6ICsxLjcuNC43Li0xLjIuNC4t
MS4xLjEuNDwvUD4NCjxQPldpdGggcmVnYXJkcyw8QlI+U3VwcG9ydCB0ZWFtPEJSPkdlZWsgU3F1
YWQ8L1A+

------=_NextPart_000_39318_01D8E233.B5C75A60--

